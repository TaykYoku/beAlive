(function(window, undefined) {
  var dictionary = {
    "d5f5c5fa-80ac-4d95-94ec-5dc67643f430": "page login hello",
    "44bbcab2-8499-4799-962b-5105b8fc8c97": "page sign up",
    "d12245cc-1680-458d-89dd-4f0d7fb22724": "intro",
    "79c655be-8cac-4a32-8d33-99312d9f1701": "tutorial",
    "101151f9-456a-4c86-8198-0d5197ef774c": "page my profile",
    "0d32fb05-4efc-458e-895d-94c3cd7a4297": "page login",
    "f39803f7-df02-4169-93eb-7547fb8c961a": "background",
    "bb8abf58-f55e-472d-af05-a7d1bb0cc014": "default"
  };

  var uriRE = /^(\/#)?(screens|templates|masters|scenarios)\/(.*)(\.html)?/;
  window.lookUpURL = function(fragment) {
    var matches = uriRE.exec(fragment || "") || [],
        folder = matches[2] || "",
        canvas = matches[3] || "",
        name, url;
    if(dictionary.hasOwnProperty(canvas)) { /* search by name */
      url = folder + "/" + canvas;
    }
    return url;
  };

  window.lookUpName = function(fragment) {
    var matches = uriRE.exec(fragment || "") || [],
        folder = matches[2] || "",
        canvas = matches[3] || "",
        name, canvasName;
    if(dictionary.hasOwnProperty(canvas)) { /* search by name */
      canvasName = dictionary[canvas];
    }
    return canvasName;
  };
})(window);