user_pref("browser.uidensity", 1);
user_pref("browser.compactmode.show", true);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org", true);
user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net", true);
// user_pref("xpinstall.signatures.required", false); // don't think this works unless i get ffx dev edition or nightly



// 0: Start with a blank page (about:blank).
// 1: Start with the web page(s) defined as the home page(s). (Default)
// 2: Load the last visited page.
// 3: Resume the previous browser session
user_pref("browser.startup.page", 3);
user_pref("browser.startup.homepage", "about:newtab"); // NOTE: using about:blank doesn't use usercontent colors for some reason
user_pref("browser.newtabpage.enabled", false); // make new tab page blank
user_pref("browser.tabs.insertAfterCurrent", true);
user_pref("browser.tabs.tabmanager.enabled", false); // remove tab manager button

// user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
// user_pref("browser.theme.content-theme", 0);
// user_pref("browser.theme.toolbar-theme", 0);
