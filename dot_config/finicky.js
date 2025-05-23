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

module.exports = {
  defaultBrowser: browserosaurus, // manually decide which browser to use
  rewrite: [
    { // Redirect all urls to use https
      match: ({ url }) => url.protocol === "http",
      url: { protocol: "https" },
    },
    { // Remove some tracking from urls

      match: () => true,
      url({ url }) {
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
    // Disabled: onion no longer gives free access
    // { // Redirect nytimes to onion
    //     match: ({ url }) => ["www.nytimes.com", "nytimes.com", "archive.nytimes.com", "nyt.com"].includes(url.host),
    //     url: { host: "www.nytimesn7cgmftshazwhfgzm37qxb44r64ytbb2dj3x62d2lljsciiyd.onion" },
    // },
    // Disabled: theguardian works without JS
    // { // Redirect theguardian to onion
    // match: ({ url }) => ["www.theguardian.com", "theguardian.com"].includes(url.host),
    //     url: { host: "www.guardian2zotagl6tmjucg3lrhxdk4dw3lhbqnkvvkywawy3oqfoprid.onion" }
    // },
    { // open hugo server in firefox w/o https
      match: ({ url }) => url.host === "localhost" && url.port === 1313,
      url: { protocol: "http", }
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
      browser: apps.mpv,
    },
    { // Open onion links in tor
      match: ({ url }) => url.host.endsWith(".onion"),
      browser: browsers.tor,
    },
    { // Open wikipedia and github in firefox. they dont need js
      match: [
        /^https:\/\/wikipedia\.com\/.*$/,
        /^https:\/\/github\.com\/.*$/,
        /^https:\/\/www\.theguardian\.com\/.*$/,
        /^https:\/\/theguardian\.com\/.*$/,
      ],
      browser: browsers.firefox,
    },
    { // Open links from feed reader and ide in firefox. Links are probably fine.
      match: ({ opener }) => [
        apps.netnewswire,
        apps.vscode,
      ].includes(opener.bundleId),
      browser: browsers.firefox,
    },
  ],
};
