let data = {
	username: "AaronGustafson", // No leading @ here
	homeLabel: "Homepage",
	homeUrl: "https://twitter.aaron-gustafson.com/",
};

data.avatar = `https://v1.indieweb-avatar.11ty.dev/${encodeURIComponent(data.homeUrl)}/`;

module.exports = data;