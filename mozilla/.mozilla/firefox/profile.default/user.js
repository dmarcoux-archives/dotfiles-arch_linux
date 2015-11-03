/******************************************************************************
 * HTML5 / APIs / DOM                                                         *
 ******************************************************************************/

// Disable Location-Aware Browsing: http://www.mozilla.org/en-US/firefox/geolocation/
user_pref("geo.enabled", false);

// Don't reveal internal IPs: http://net.ipcalf.com/
user_pref("media.peerconnection.enabled", false);

// getUserMedia
// https://wiki.mozilla.org/Media/getUserMedia
// https://developer.mozilla.org/en-US/docs/Web/API/Navigator
user_pref("media.navigator.enabled",false);
// https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager
user_pref("dom.battery.enabled",false);
// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
user_pref("dom.telephony.enabled",false);
// https://developer.mozilla.org/en-US/docs/Web/API/navigator.sendBeacon
user_pref("beacon.enabled", false);
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference/dom.event.clipboardevents.enabled
user_pref("dom.event.clipboardevents.enabled",false);
// https://wiki.mozilla.org/Security/Reviews/Firefox/NavigationTimingAPI
user_pref("dom.enable_performance", false);

// Speech recognition
// https://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html
// https://wiki.mozilla.org/HTML5_Speech_API
user_pref("media.webspeech.recognition.enable", false);

// Disable getUserMedia screen sharing
// https://mozilla.github.io/webrtc-landing/gum_test.html
user_pref("media.getusermedia.screensharing.enabled", false);

// Disable sensor API
// https://wiki.mozilla.org/Sensor_API
user_pref("device.sensors.enabled", false);

// http://kb.mozillazine.org/Browser.send_pings
user_pref("browser.send_pings", false);
// This shouldn't have any effect, since we block pings altogether, but we'll set it anyway.
// http://kb.mozillazine.org/Browser.send_pings.require_same_host
user_pref("browser.send_pings.require_same_host", true);

/******************************************************************************
 * Misc                                                                       *
 ******************************************************************************/

// Default search engine
user_pref("browser.search.defaultenginename", "DuckDuckGo");

// http://kb.mozillazine.org/Clipboard.autocopy
user_pref("clipboard.autocopy", false);

// Display an error message indicating the entered information is not a valid
// URL instead of asking from google.
// http://kb.mozillazine.org/Keyword.enabled#Caveats
user_pref("keyword.enabled",false);

// Don't try to guess where i'm trying to go!!! e.g.: "http://foo" -> "http://(prefix)foo(suffix)"
// http://www-archive.mozilla.org/docs/end-user/domain-guessing.html
user_pref("browser.fixup.alternate.enabled",false);

/******************************************************************************
 * Extensions / Plugins                                                       *
 ******************************************************************************/

// https://wiki.mozilla.org/Firefox/Click_To_Play
// https://blog.mozilla.org/security/2012/10/11/click-to-play-plugins-blocklist-style/
user_pref("plugins.click_to_play", true);

// Updates addons automatically
// https://blog.mozilla.org/addons/how-to-turn-off-add-on-updates/
user_pref("extensions.update.enabled", true);

// http://kb.mozillazine.org/Extensions.blocklist.enabled
user_pref("extensions.blocklist.enabled", true);

/*
 TODO check https://github.com/pyllyukko/user.js/blob/master/user.js
*/
