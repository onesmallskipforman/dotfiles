// TODO: goal is to move as much as possible to userchrome css

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
user_pref("browser.startup.homepage", "about:newtab");
user_pref("browser.newtabpage.enabled", false); // make new tab page blank
user_pref("browser.tabs.insertAfterCurrent", true);

// options: 'always', 'never', 'newtab'
user_pref("browser.toolbars.bookmarks.visibility", "never");

// needed to change about:newtab background. flashing is handled in userchrome
// TODO: replace with usercontent css
user_pref("browser.display.background_color", "#282828");
user_pref("browser.display.background_color.dark", "#282828");

// user_pref("layout.css.devPixelsPerPx", -1.0);

// TODO: doesn't seem to work
// user_pref("browser.newtabpage.activity-stream.showRecentSaves", false);
// user_pref("browser.newtabpage.activity-stream.showSearch", false);
// user_pref("browser.newtabpage.activity-stream.showSponsored", false);
// user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
// user_pref("browser.newtabpage.activity-stream.showWeather", false);
