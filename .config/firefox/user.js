user_pref("browser.uidensity", 1);
user_pref("browser.compactmode.show", true);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org", true);
user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net", true);
// user_pref("xpinstall.signatures.required", false); // don't think this works unless i get ffx dev edition or nightly


user_pref("browser.tabs.tabmanager.enabled", false); // remove tab manager button

// 0: Start with a blank page (about:blank).
// 1: Start with the web page(s) defined as the home page(s). (Default)
// 2: Load the last visited page.
// 3: Resume the previous browser session
user_pref("browser.startup.page", 3);


// user_pref("browser.startup.homepage", "about:blank"); // TODO: using about:blank doesn't use usercontent colors for some reason
user_pref("browser.startup.homepage", "about:newtab");



user_pref("browser.newtabpage.enabled", false);
user_pref("browser.tabs.insertAfterCurrent", true);
