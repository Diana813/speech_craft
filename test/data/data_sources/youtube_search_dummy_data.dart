import 'dart:convert';

String dummySearchResults = json.encode({
  "kind": "youtube#searchListResponse",
  "etag": "kmH0pP7i29uKBCrHjZqLNUVXizU",
  "nextPageToken": "CAgQAA",
  "regionCode": "PL",
  "pageInfo": {"totalResults": 1000000, "resultsPerPage": 8},
  "items": [
    {
      "kind": "youtube#searchResult",
      "etag": "F5LCQfB6-rbFNkerc_iIYMOQC0M",
      "id": {"kind": "youtube#video", "videoId": "8oRRZiRQxTs"},
      "snippet": {
        "publishedAt": "2024-01-03T17:00:08Z",
        "channelId": "UCQoxJOkwaCgyzQtiuAIDcuw",
        "title": "Katt Williams Unleashed | CLUB SHAY SHAY",
        "description": "ClubShaySha #kattwilliams #comedy The legendary Katt Williams, hailed by many as the greatest comedian alive, joins ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/8oRRZiRQxTs/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/8oRRZiRQxTs/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/8oRRZiRQxTs/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "Club Shay Shay",
        "liveBroadcastContent": "none",
        "publishTime": "2024-01-03T17:00:08Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "BKB2C3t7NpUNrvH2GFGJpxMlxRM",
      "id": {"kind": "youtube#video", "videoId": "nARu4hfaQKc"},
      "snippet": {
        "publishedAt": "2024-01-03T20:00:29Z",
        "channelId": "UCQoxJOkwaCgyzQtiuAIDcuw",
        "title": "Katt Williams Calls Out Steve Harvey, Kevin Hart, Cedric The Entertainer, and Rickey Smiley",
        "description": "Katt Williams Calls Out Steve Harvey, Kevin Hart, Cedric The Entertainer, and Rickey Smiley: \"I have watched all these low brow ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/nARu4hfaQKc/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/nARu4hfaQKc/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/nARu4hfaQKc/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "Club Shay Shay",
        "liveBroadcastContent": "none",
        "publishTime": "2024-01-03T20:00:29Z"
      }
    }
  ]
});


String exampleErrorResponse = json.encode({
  "error": {
    "code": 403,
    "message": "Method doesn't allow unregistered callers (callers without established identity). Please use API Key or other form of API consumer identity to call this API.",
    "errors": [
      {
        "message": "Method doesn't allow unregistered callers (callers without established identity). Please use API Key or other form of API consumer identity to call this API.",
        "domain": "global",
        "reason": "forbidden"
      }
    ],
    "status": "PERMISSION_DENIED"
  }
});