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

// TODO: doesn't seem to work
// https://www.reddit.com/r/firefox/comments/z2gz9u/saving_the_customized_toolbar_layout/
// user_pref("browser.uiCustomization.state", {"placements": {
//     "widget-overflow-fixed-list":[],
//     "nav-bar":[
//         "back-button",
//         "forward-button",
//         "stop-reload-button",
//         "customizableui-special-spring1",
//         "urlbar-container",
//         "customizableui-special-spring2",
//         "save-to-pocket-button",
//         "downloads-button",
//         "fxa-toolbar-menu-button",
//         "unified-extensions-button"
//     ],
//     "TabsToolbar":[
//         // "firefox-view-button",
//         "tabbrowser-tabs",
//         "new-tab-button",
//         "alltabs-button"
//     ],
//     "PersonalToolbar":["personal-bookmarks"],
//     "unified-extensions-area":[
//         "_news-feed-eradicator-browser-action",
//         "myallychou_gmail_com-browser-action",
//         "_contain-facebook-browser-action",
//         "addon_darkreader_org-browser-action",
//         "extension_one-tab_com-browser-action",
//         "ublock0_raymondhill_net-browser-action",
//         "_88ebde3a-4581-4c6b-8019-2a05a9e3e938_-browser-action",
//         "_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action"]
//     },
//     "seen":[
//         "save-to-pocket-button",
//         "_news-feed-eradicator-browser-action",
//         "myallychou_gmail_com-browser-action",
//         "_contain-facebook-browser-action",
//         "addon_darkreader_org-browser-action",
//         "extension_one-tab_com-browser-action",
//         "ublock0_raymondhill_net-browser-action",
//         "_88ebde3a-4581-4c6b-8019-2a05a9e3e938_-browser-action",
//         "_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action",
//         "developer-button"
//     ],
//     "dirtyAreaCache":["unified-extensions-area"],
//     "currentVersion":20,
//     "newElementCount":2
// });



// TODO: doesn't seem to work
// user_pref("browser.newtabpage.activity-stream.showRecentSaves", false);
// user_pref("browser.newtabpage.activity-stream.showSearch", false);
// user_pref("browser.newtabpage.activity-stream.showSponsored", false);
// user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
// user_pref("browser.newtabpage.activity-stream.showWeather", false);
