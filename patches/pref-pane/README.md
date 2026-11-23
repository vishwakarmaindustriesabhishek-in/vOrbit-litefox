### overview:
* This folder replaces the original big pref-pane.patch, the original patch is moved into the `patches/removed-patches` folder.
* This new solution should make it much easier for everyone to edit the vorbit preferences.

#### vorbit.inc.xhtml
Contains the html elements that make up the preferences UI. for example, a checkmark to 'enable firefox sync'. In this example there is a html snippet that uses only the `identity.fxaccounts.enabled` setting, so no JavaScript needed.
#### vorbit.js
Other code called by the ui elements.
#### preferences.ftl
In our running xhtml example, we have a string id `data-l10n-id="vorbit-sync-checkbox"` that we can find in our`.ftl` file.


#### note: new files, these contain all the logic for the pref-pane:

* category-vorbit.svg -> browser/themes/shared/preferences/category-vorbit.svg
* vorbit.css -> browser/themes/shared/preferences/vorbit.css
* vorbit.inc.xhtml -> browser/components/preferences/vorbit.inc.xhtml
* vorbit.js -> browser/components/preferences/vorbit.js

#### note: appending these string values to the original preferences.ftl:

* preferences.ftl -- append to --> browser/locales/en-US/browser/preferences/preferences.ftl
