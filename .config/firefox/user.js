user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// user_pref("xpinstall.signatures.required", false); // don't think this works unless i get ffx dev edition or nightly

// 0: Start with a blank page (about:blank).
// 1: Start with the web page(s) defined as the home page(s). (Default)
// 2: Load the last visited page.
// 3: Resume the previous browser session
user_pref("browser.startup.page", 3);
// user_pref("browser.startup.homepage", "moz-extension://5b014a50-119d-4ace-a947-f54e6a097985/static/newtab.html");
user_pref("browser.newtabpage.enabled", true); // make new tab page blank
user_pref("browser.tabs.insertAfterCurrent", true);
user_pref("browser.tabs.hoverPreview.enabled", false);
user_pref("browser.tabs.hoverPreview.showThumbnails", false);

// options: 'always', 'never', 'newtab'
user_pref("browser.toolbars.bookmarks.visibility", "never");

// TODO: doesn't seem to work
// user_pref("browser.newtabpage.activity-stream.showRecentSaves", false);
// user_pref("browser.newtabpage.activity-stream.showSearch", false);
// user_pref("browser.newtabpage.activity-stream.showSponsored", false);
// user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
// user_pref("browser.newtabpage.activity-stream.showWeather", false);
