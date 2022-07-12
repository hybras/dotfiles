const steam = "com.valvesoftware.steam"
const netnewswire = "com.ranchero.NetNewsWire-Evergreen"
const browserosaurus = "com.browserosaurus"
const tor = "org.torproject.torbrowser"
const zoom = "us.zoom.xos"
const vscode = "com.visualstudio.code.oss"
const brave = "com.brave.Browser"
const iridium = "de.iridiumbrowser"
const chrome = "com.google.Chrome"

module.exports = {
    defaultBrowser: browserosaurus,
    rewrite: [
        {
            // Redirect all urls to use https
            match: ({ url }) => url.protocol === "http",
            url: { protocol: "https" },
        },
        {
            // Remove some tracking from urls
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
    ],
    handlers: [
        {
            match: [
                /^https:\/\/youtube\.com\/.*$/,
                /^https:\/\/wikipedia\.com\/.*$/,
                /^https:\/\/github\.com\/.*$/,
                /^https:\/\/feed.dilbert.com\/.*$/,
            ],
            browser: iridium,
        },
        {
            match: ({ opener }) => [
                netnewswire,
                vscode,
            ].includes(opener.bundleId),
            browser: iridium,
        },
        {
            match: ({ opener }) => [
                zoom,
                steam,
            ].includes(opener.bundleId),
            browser: chrome,
        },
    ],
};
