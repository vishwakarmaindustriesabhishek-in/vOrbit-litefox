## vorbit preferences

# Sidebar
pane-vorbit-title = vOrbit-lite
category-vorbit =
    .tooltiptext = about:config changes, logically grouped and easily accessible
# Main content
vorbit-header = vOrbit-lite Preferences
vorbit-warning-title = Heads up!
vorbit-warning-description = We carefully choose default settings to focus on privacy and security. When changing these settings, read the descriptions to understand the implications of those changes.
# Page Layout
vorbit-general-heading2 =
    .label = Browser Behavior
vorbit-extension-update-checkbox2 =
    .label = Update add-ons automatically
    .description = Keep extensions up to date without manual intervention. A good choice for your security.
vorbit-sync-checkbox2 =
    .label = Enable Firefox Sync
    .description = Sync your data with other browsers. Requires restart.
vorbit-autocopy-checkbox2 =
    .label = Enable middle click paste
    .description = Select some text to copy it, then paste it with a middle-mouse click.
vorbit-styling-checkbox2 =
    .label = Allow userChrome.css customization
    .description = Enable this if you want to customize the UI with a manually loaded theme.
vorbit-network-heading2 =
    .label = Networking
vorbit-ipv6-checkbox2 =
    .label = Enable IPv6
    .description = Allow { -brand-short-name } to connect using IPv6.
vorbit-privacy-heading2 =
    .label = Privacy
vorbit-xorigin-ref-checkbox2 =
    .label = Limit cross-origin referrers
    .description = Send a referrer only on same-origin.
vorbit-broken-heading2 =
    .label = Fingerprinting
vorbit-webgl-checkbox2 =
    .label = Always allow WebGL
    .description = This will always allow WebGL without requiring permission.
vorbit-webgl-prompt-checkbox2 =
    .label = Hide the WebGL per-site popup
    .description = This hides the popup that appears when a site tries to create a WebGL context. You can still manually bring up the prompt by clicking the icon in the searchbar.
vorbit-rfp-checkbox2 =
    .label = Enable ResistFingerprinting
    .description = Enables all available fingerprint mitigations, but can cause some websites to function improperly.
vorbit-letterboxing-checkbox2 =
    .label = Enable letterboxing
    .description = Letterboxing applies margins around your windows, in order to return a limited set of rounded resolutions.
vorbit-security-heading2 =
    .label = Security
vorbit-ocsp-checkbox =
    .label = Enforce OCSP hard-fail
vorbit-goog-safe-checkbox =
    .label = Enable Google Safe Browsing
vorbit-goog-safe-download-checkbox =
    .label = Scan downloads
# In-depth descriptions
vorbit-ocsp-description = Prevent connecting to a website if the OCSP check cannot be performed.
vorbit-ocsp-warning1 = This increases security, but it will cause breakage when an OCSP server is down.
vorbit-goog-safe-description = If you are worried about malware and phishing, consider enabling it.
vorbit-goog-safe-warning1 = Disabled over censorship concerns but recommended for less advanced users. All the checks happen locally.
vorbit-goog-safe-download-description = Allow Safe Browsing to scan your downloads to identify suspicious files.
vorbit-goog-safe-download-warning1 = All the checks happen locally.
# Footer
vorbit-footer = Useful links
vorbit-config-link = All advanced settings (about:config)
vorbit-open-profile = Open user profile directory

## Privacy & Security preferences

content-blocking-section-top-level-description = vOrbit-lite supports - and it enables by default - Enhanced Tracking Protection in Strict mode. This is one of the most important settings in the browser, as it provides state partitioning, strict blocking lists and other neat privacy features. We do not recommend changing to other modes.

## Permissions

permissions-webgl2 =
    .label = WebGL