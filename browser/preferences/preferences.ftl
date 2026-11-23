session-restore-learn-more = What if it does not work?

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
vorbit-general-heading = Browser Behavior
vorbit-extension-update-checkbox =
    .label = Update add-ons automatically
vorbit-sync-checkbox =
    .label = Enable Firefox Sync
vorbit-autocopy-checkbox =
    .label = Enable middle click paste
vorbit-styling-checkbox =
    .label = Allow userChrome.css customization

vorbit-network-heading = Networking
vorbit-ipv6-checkbox =
    .label = Enable IPv6

vorbit-privacy-heading = Privacy
vorbit-xorigin-ref-checkbox =
    .label = Limit cross-origin referrers

vorbit-broken-heading = Fingerprinting
vorbit-webgl-checkbox =
    .label = Enable WebGL
vorbit-rfp-checkbox =
    .label = Enable ResistFingerprinting
vorbit-letterboxing-checkbox =
    .label = Enable letterboxing

vorbit-security-heading = Security
vorbit-goog-safe-checkbox =
    .label = Enable Google Safe Browsing
vorbit-goog-safe-download-checkbox =
    .label = Scan downloads

# In-depth descriptions
vorbit-extension-update-description = Keep extensions up to date without manual intervention. A good choice for your security.
vorbit-extension-update-warning1 = If you don't review the code of your extensions before every update, you should enable this option.

vorbit-ipv6-description = Allow { -brand-short-name } to connect using IPv6.
vorbit-ipv6-warning1 = Instead of blocking IPv6 in the browser, we suggest enabling the IPv6 privacy extension in your OS.
vorbit-sync-description = Sync your data with other browsers. Requires restart.
vorbit-sync-warning1 = Firefox Sync encrypts data locally before transmitting it to the server.

vorbit-autocopy-description = Select some text to copy it, then paste it with a middle-mouse click.

vorbit-styling-description = Enable this if you want to customize the UI with a manually loaded theme.
vorbit-styling-warning1 = Make sure you trust the provider of the theme.

vorbit-xorigin-ref-description = Send a referrer only on same-origin.
vorbit-xorigin-ref-warning1 = This may cause breakage. Additionally, even when sent referrers will still be trimmed.

vorbit-webgl-description = WebGL is a strong fingerprinting vector.
vorbit-webgl-warning1 = If you need to enable it, consider using an extension like Canvas Blocker.

vorbit-rfp-description = ResistFingerprinting is the best in class anti-fingerprinting tool.
vorbit-rfp-warning1 = If you need to disable it, consider using an extension like Canvas Blocker.

vorbit-letterboxing-description = Letterboxing applies margins around your windows, in order to return a limited set of rounded resolutions.

vorbit-goog-safe-description = If you are worried about malware and phishing, consider enabling it.
vorbit-goog-safe-warning1 = Disabled over censorship concerns but recommended for less advanced users. All the checks happen locally.

vorbit-goog-safe-download-description = Allow Safe Browsing to scan your downloads to identify suspicious files.
vorbit-goog-safe-download-warning1 = All the checks happen locally.

# Footer
vorbit-footer = Useful linkss
vorbit-config-link = All advanced settings (about:config)
vorbit-open-profile = Open user profile directory
