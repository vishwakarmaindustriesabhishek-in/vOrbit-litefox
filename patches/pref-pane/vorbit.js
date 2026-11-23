/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/. */

/* import-globals-from extensionControlled.js */
/* import-globals-from preferences.js */

ChromeUtils.defineLazyGetter(this, "L10n", () => {
  return new Localization([
    "branding/brand.ftl",
    "browser/preferences/preferences.ftl",
  ]);
});

Preferences.addAll([
  // IPv6
  { id: "network.dns.disableIPv6", type: "bool" },
  // Firefox Accounts
  { id: "identity.fxaccounts.enabled", type: "bool" },
  // WebGL
  { id: "vorbit.webgl.prompt", type: "bool" },
  { id: "vorbit.webgl.prompt.hide", type: "bool" },
  // Automatically Update Extensions
  { id: "extensions.update.enabled", type: "bool" },
  { id: "extensions.update.autoUpdateDefault", type: "bool" },
  // Clipboard autocopy/paste
  { id: "clipboard.autocopy", type: "bool" },
  { id: "middlemouse.paste", type: "bool" },
  // XOrigin referrers
  { id: "network.http.referer.XOriginPolicy", type: "int" },
  // Harden
  { id: "privacy.resistFingerprinting.letterboxing", type: "bool" },
  // Google Safe Browsing
  //{ id: "browser.safebrowsing.malware.enabled", type: "bool" }, // Already loaded
  //{ id: "browser.safebrowsing.phishing.enabled", type: "bool" },
  { id: "browser.safebrowsing.blockedURIs.enabled", type: "bool" },
  { id: "browser.safebrowsing.provider.google4.gethashURL", type: "string" },
  { id: "browser.safebrowsing.provider.google4.updateURL", type: "string" },
  { id: "browser.safebrowsing.provider.google.gethashURL", type: "string" },
  { id: "browser.safebrowsing.provider.google.updateURL", type: "string" },
  /**** Prefs that require changing a lockPref ****/
  // Google safe browsing check downloads
  //{ id: "browser.safebrowsing.downloads.enabled", type: "bool" }, //Also already added
  { id: "toolkit.legacyUserProfileCustomizations.stylesheets", type: "bool" },
]);

Preferences.addSetting({
  id: "vorbitExtensionUpdateEnabled",
  pref: "extensions.update.enabled",
});
Preferences.addSetting({
  id: "vorbitExtensionAutoUpdateEnabled",
  pref: "extensions.update.autoUpdateDefault",
});
Preferences.addSetting({
  id: "vorbitExtensionUpdate",
  deps: ["vorbitExtensionUpdateEnabled","vorbitExtensionAutoUpdateEnabled"],
  get: (_, deps) => deps.vorbitExtensionUpdateEnabled.value && deps.vorbitExtensionAutoUpdateEnabled.value,
  set: (value, deps) => {
      deps.vorbitExtensionUpdateEnabled.value = value;
      deps.vorbitExtensionAutoUpdateEnabled.value = value;
  },
});

Preferences.addSetting({
  id: "vorbitSync",
  pref: "identity.fxaccounts.enabled",
  onUserChange() {
    confirmRestartPrompt(
      Services.prefs.getBoolPref("identity.fxaccounts.enabled"),
      1,
      true,
      false
    ).then(buttonIndex => {
      if (buttonIndex == CONFIRM_RESTART_PROMPT_RESTART_NOW) {
          Services.startup.quit(
            Ci.nsIAppStartup.eAttemptQuit | Ci.nsIAppStartup.eRestart
          );
          return
        }
    });
  }
});

Preferences.addSetting({
  id: "vorbitAutocopy",
  pref: "clipboard.autocopy",
});
Preferences.addSetting({
  id: "vorbitPaste",
  pref: "middlemouse.paste",
});
Preferences.addSetting({
  id: "vorbitMiddleClick",
  deps: ["vorbitAutocopy","vorbitPaste"],
  get: (_, deps) => deps.vorbitAutocopy.value && deps.vorbitPaste.value,
  set: (value, deps) => {
      deps.vorbitAutocopy.value = value;
      deps.vorbitPaste.value = value;
  },
});

Preferences.addSetting({
  id: "vorbitUserChrome",
  pref: "toolkit.legacyUserProfileCustomizations.stylesheets",
});

Preferences.addSetting({
  id: "vorbitIPv6",
  pref: "network.dns.disableIPv6",
  get: (value) => value.value = !value,
  set: (value) => value.value = !value,
});

Preferences.addSetting({
  id: "vorbitCrossOrigin",
  pref: "network.http.referer.XOriginPolicy",
  get: (value) => {
    if (value == 2) {
      return true;
    } else {
      return false;
    }
  },
  set: (value) => value ? 2 : 0,
});

Preferences.addSetting({
  id: "vorbitRFP",
  pref: "privacy.resistFingerprinting",
});
Preferences.addSetting({
  id: "vorbitLetterboxing",
  pref: "privacy.resistFingerprinting.letterboxing",
});

Preferences.addSetting({
  id: "vorbitWebGLPrompt",
  pref: "vorbit.webgl.prompt",
  get: (value) => value.value = !value,
  set: (value) => value.value = !value,
});
Preferences.addSetting({
  id: "vorbitWebGLPromptHide",
  pref: "vorbit.webgl.prompt.hide",
  deps: ["vorbitWebGLPrompt"],
  disabled: ({vorbitWebGLPrompt}) => {
    return vorbitWebGLPrompt.value;
  },
});


function openProfileDirectory() {
  // Get the profile directory.
  let currProfD = Services.dirsvc.get("ProfD", Ci.nsIFile);
  let profileDir = currProfD.path;

  // Show the profile directory.
  let nsLocalFile = Components.Constructor(
    "@mozilla.org/file/local;1",
    "nsIFile",
    "initWithPath"
  );
  new nsLocalFile(profileDir).reveal();
}

function openAboutConfig() {
  window.open("about:config", "_blank");
}

var gvorbitPane = {
  _pane: null,

  // called when the document is first parsed
  init() {
    this._pane = document.getElementById("panevorbit");
    initSettingGroup("vorbitBehavior");
    initSettingGroup("vorbitNetworking");
    initSettingGroup("vorbitPrivacy");
    initSettingGroup("vorbitFingerprinting");

    // Set event listener on open profile directory button
    setEventListener("vorbit-open-profile", "command", openProfileDirectory);
    // Set event listener on open about:config button
    setEventListener("vorbit-config-link", "click", openAboutConfig);

    // Notify observers that the UI is now ready
    Services.obs.notifyObservers(window, "vorbit-pane-loaded");
  },
};
