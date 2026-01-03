import type { FinickyConfig } from "/Users/hybras/Applications/Finicky.app/Contents/Resources/finicky.d.ts";

const browserosaurus = "com.browserosaurus"

const browsers = {
  firefox: "org.mozilla.firefox",
  chrome: "com.google.Chrome",
  tor: "org.torproject.torbrowser",
  orion: "com.kagi.kagimacOS",
}

const apps = {
  freetube: "io.freetubeapp.freetube",
  mpv: "io.mpv",
  vscode: "com.visualstudio.code.oss",
  zoom: "us.zoom.xos",
  netnewswire: "com.ranchero.NetNewsWire-Evergreen",
  steam: "com.valvesoftware.steam",
}

/**
 * @type {FinickyConfig}
 */
export default {
  defaultBrowser: browserosaurus, // manually decide which browser to use
  rewrite: [
    { // Redirect all urls to use https
      match: (url) => url.protocol === "http",
      url: (url) => { return { ...url, protocol: "https" } },
    },
    { // Remove some tracking from urls

      match: (url) => true,
      url: (url) => {
        const removeKeysStartingWith = ["utm_", "uta_"]; // Remove all query parameters beginning with these strings
        const removeKeys = ["fblid", "gclid"]; // Remove all query parameters matching these keys

        const search = url.search
          .split("&")
          .map((parameter) => parameter.split("="))
          .filter(([key]) => !removeKeysStartingWith.some((startingWith) => key.startsWith(startingWith)))
          .filter(([key]) => !removeKeys.some((removeKey) => key === removeKey));

        return {
          ...url,
          search: search.map((parameter) => parameter.join("=")).join("&"),
        };
      },
    },
    { // open hugo server in firefox w/o https
      match: (url) => url.host === "localhost" && url.port === '1313',
      url: (url) => { return { ...url, protocol: "http" } }
    }
  ],
  handlers: [
    {
      match: /^http:\/\/localhost:1313\/.*$/,
      browser: browsers.firefox,
    },
    { // Open Youtube in Freetube
      match: [
        /^https:\/\/youtube\.com\/.*$/,
        /^https:\/\/www\.youtube\.com\/.*$/,
        /^https:\/\/youtu\.be\/.*$/,
      ],
      browser: apps.freetube,
    },
    { // Open onion links in tor
      match: (url) => url.host.endsWith(".onion"),
      browser: browsers.tor,
    },
    { // Open wikipedia and github in firefox. they dont need js
      match: finicky.matchHostnames([
        "wikipedia.com",
        "github.com",
        "www.theguardian.com",
        "theguardian.com",
      ]),
      browser: browsers.firefox,
    },
    { // Open links from feed reader and ide in firefox. Links are probably fine.
      match: (_url, options) => [
        apps.netnewswire,
        apps.vscode,
      ].includes(options.opener?.bundleId || ''),
      browser: browsers.firefox,
    },
  ],
} satisfies FinickyConfig;
