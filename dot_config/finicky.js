const steam = "com.valvesoftware.steam"
const netnewswire = "com.ranchero.NetNewsWire-Evergreen"
const browserosaurus = "com.browserosaurus"
const tor = "org.torproject.torbrowser"
const zoom = "us.zoom.xos"
const vscode = "com.visualstudio.code.oss"
const brave = "com.brave.Browser"
const iridium = "de.iridiumbrowser"
const chrome = "com.google.Chrome"
const firefox = "org.mozilla.firefox"
const freetube = "io.freetubeapp.freetube"

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
        {
            match: ({ url }) => ["www.nytimes.com", "nytimes.com", "archive.nytimes.com", "nyt.com"].includes(url.host),
            url: { host: "www.nytimesn7cgmftshazwhfgzm37qxb44r64ytbb2dj3x62d2lljsciiyd.onion" },
        }
    ],
    handlers: [
        { // Open Youtube in Freetube
            match: [
                /^https:\/\/youtube\.com\/.*$/,
                /^https:\/\/www\.youtube\.com\/.*$/,
                /^https:\/\/youtu\.be\/.*$/,
            ],
            browser: freetube,
        },
        { // Open onion links in tor
            match: ({ url }) => url.host.endsWith(".onion"),
            browser: tor,
        },
        {
            match: [
                /^https:\/\/wikipedia\.com\/.*$/,
                /^https:\/\/github\.com\/.*$/,
            ],
            browser: firefox,
        },
        { // Open links from feed reader and ide in firefox. Links are probably fine.
            match: ({ opener }) => [
                netnewswire,
                vscode,
            ].includes(opener.bundleId),
            browser: firefox,
        },
        { // Open links from zoom and steam in chrome. They're probably to pages that need javascript or signing in.
            match: ({ opener }) => [
                zoom,
                steam,
            ].includes(opener.bundleId),
            browser: chrome,
        },
    ],
};
