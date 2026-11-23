import gzip
import hashlib
import json
import os
from pathlib import Path
import stat
import sys

source = Path(sys.argv[1])
manifest = Path(sys.argv[2])
wanted = set()
file_count = 0
with gzip.open(manifest, "rt", encoding="utf-8") as stream:
    for line in stream:
        name, kind, value, *digest = json.loads(line)
        rel = Path(name)
        assert not rel.is_absolute() and ".." not in rel.parts, name
        path = source / rel
        wanted.add(name)
        if kind == "directory":
            assert path.is_dir() and not path.is_symlink(), name
            path.chmod(stat.S_IMODE(value))
        elif kind == "symlink":
            assert path.is_symlink() and os.readlink(path) == value, name
        else:
            assert path.is_file() and not path.is_symlink(), name
            with path.open("rb") as handle:
                assert hashlib.file_digest(handle, "sha256").hexdigest() == digest[0], name
            path.chmod(stat.S_IMODE(value))
            file_count += 1

for directory, dirs, files in os.walk(source, topdown=False, followlinks=False):
    for name in files + dirs:
        path = Path(directory) / name
        if path.relative_to(source).as_posix() in wanted:
            continue
        if path.is_dir() and not path.is_symlink():
            path.rmdir()
        else:
            path.unlink()
print(f"Verified {file_count:,} files against the prepared local source archive")

