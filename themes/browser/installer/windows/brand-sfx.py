# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

import ctypes
from ctypes import wintypes
from pathlib import Path
import shutil
import struct
import sys


def brand_sfx(source, icon_path, output):
    kernel = ctypes.WinDLL("kernel32", use_last_error=True)
    begin = kernel.BeginUpdateResourceW
    begin.argtypes = (wintypes.LPCWSTR, wintypes.BOOL)
    begin.restype = wintypes.HANDLE
    update = kernel.UpdateResourceW
    update.argtypes = (
        wintypes.HANDLE, ctypes.c_void_p, ctypes.c_void_p, wintypes.WORD,
        wintypes.LPCVOID, wintypes.DWORD,
    )
    update.restype = wintypes.BOOL
    end = kernel.EndUpdateResourceW
    end.argtypes = (wintypes.HANDLE, wintypes.BOOL)
    end.restype = wintypes.BOOL

    data = icon_path.read_bytes()
    reserved, kind, count = struct.unpack_from("<HHH", data)
    if reserved or kind != 1 or not count:
        raise ValueError(f"Invalid icon file: {icon_path}")

    staged = output.with_suffix(".tmp")
    shutil.copyfile(source, staged)
    try:
        handle = begin(str(staged), False)
        if not handle:
            raise ctypes.WinError(ctypes.get_last_error())

        # Both Mozilla SFX templates use icon group 1, en-US.
        language = 1033
        group = bytearray(data[:6])
        try:
            for frame in range(count):
                start = 6 + frame * 16
                size, offset = struct.unpack_from("<II", data, start + 8)
                image = data[offset:offset + size]
                if len(image) != size:
                    raise ValueError(f"Truncated icon frame in {icon_path}")
                resource = frame + 1
                if not update(handle, 3, resource, language, image, size):
                    raise ctypes.WinError(ctypes.get_last_error())
                group.extend(data[start:start + 12])
                group.extend(struct.pack("<H", resource))

            group_data = bytes(group)
            if not update(handle, 14, 1, language, group_data, len(group_data)):
                raise ctypes.WinError(ctypes.get_last_error())
        except BaseException:
            end(handle, True)
            raise

        if not end(handle, False):
            raise ctypes.WinError(ctypes.get_last_error())
        staged.replace(output)
    finally:
        staged.unlink(missing_ok=True)


if __name__ == "__main__":
    brand_sfx(*(Path(arg) for arg in sys.argv[1:]))
