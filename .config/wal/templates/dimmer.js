// ==UserScript==
// @name        Dimmer (localStorage)
// @description Toggle dark mode using an icon placed at the bottom left of your screen. Hotkey: Command + Shift + D
// @author      Schimon Jehudah, Adv.
// @namespace   org.openuserjs.sjehuda.Dimmer
// @homepageURL https://openuserjs.org/scripts/sjehuda/Dimmer
// @supportURL  https://openuserjs.org/scripts/sjehuda/Dimmer/issues
// @updateURL   https://openuserjs.org/meta/sjehuda/Dimmer.meta.js
// @copyright   2023, Schimon Jehudah (http://schimon.i2p)
// @license     MIT; https://opensource.org/licenses/MIT
// @icon        data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48dGV4dCB5PSIuOWVtIiBmb250LXNpemU9IjkwIj7wn5SFPC90ZXh0Pjwvc3ZnPgo=
// @include     *
// @exclude     devtools://*
// @version     23.04.09
// @require     https://cdn.jsdelivr.net/npm/darkreader/darkreader.min.js
// @noframes
// ==/UserScript==

/* TODO

Toggle color of button.
btn.style.filter = 'hue-rotate(500deg)'
See https://noscript.net/ or
use a plain character '●'.
btn.style.color = 'black' */


if (document.doctype == null) {{ return; }}

const
  namespace = 'org-openuserjs-sjehuda-dimmer',
  btn = document.createElement(namespace);

// create button
(function createButton() {{
  // create element
  document.body.append(btn);
  // set content
  btn.textContent = '🔆';
  btn.id = namespace;
  // set position
  btn.style.position = 'fixed';
  btn.style.bottom = 0;
  btn.style.left = 0;
  // set appearance
  btn.style.marginTop = '100px';
  btn.style.marginRight = '10px';
  btn.style.minWidth = '50px';
  btn.style.minHeight = '50px';
  btn.style.fontSize = '20px';
  btn.style.zIndex = 10000;
  btn.style.opacity = 0.5;
  btn.onmouseover = () => {{
    document
      .getElementById(namespace)
      .style.opacity = 0.9;
  }};
  btn.onmouseout = () => {{
    document
      .getElementById(namespace)
      .style.opacity = 0.3;
  }};
  // center character
  btn.style.justifyContent = 'center';
  btn.style.alignItems = 'center';
  btn.style.display = 'flex';
  // disable selection marks
  btn.style.outline = 'none';
  btn.style.userSelect = 'none';
  btn.style.cursor = 'default';
  // set button behaviour
  btn.onclick = () => {{
    try {{
      toggle();
    }} catch (err) {{
      toggleByShape();
      console.warn('No support for API localStorage');
      console.error(err);
    }}
  }};
  try {{
    if (getPreference('dimmer') > 0) {{
      enable()
    }} else {{
      disable();
    }}
  }} catch (err) {{
    console.warn('No support for API localStorage');
    console.error(err);
  }}
}})();

// set hotkey
document.onkeyup = function(e) {{
  //if (e.ctrlKey && e.shiftKey && e.which == 190) {{ // Ctrl + Shift + <
  if (e.metaKey && e.shiftKey && e.which == 68) {{ // Command + Shift + D
    toggle();
  }}
}};

// toggle mode
function toggle() {{
  if (getPreference('dimmer') < 1) {{ // TODO Add random to avoid abuse by 3rd party
    setPreference('dimmer', 1);
    enable();
  }} else {{
    setPreference('dimmer', 0);
    disable();
  }}
}}

// toggle mode
function toggleByShape() {{
  if (btn.textContent == '🔆') {{
    enable()
  }} else {{
    disable();
  }}
}}

function disable() {{
  DarkReader.disable({{
    brightness: 100,
    contrast: 90,
    sepia: 10
  }});
  btn.textContent = '🔆';
  //return '🔆';
}}

function enable() {{
  DarkReader.setFetchMethod(window.fetch); // https://eligrey.com/
  DarkReader.enable({{
    brightness: 100,
    contrast: 100,
    sepia: 0,
    darkSchemeBackgroundColor: "{color0}",
    darkSchemeTextColor: "{color15}"
  }});
  btn.textContent = '🔅';
  //return '🔅';
}}

function getPreference(key) {{
  return window.localStorage.getItem(key);
}}

function setPreference(key, value) {{
  return window.localStorage.setItem(key, value);
}}
