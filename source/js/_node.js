$ = require("jquery");
oboe = require("oboe");

dom = $("#articles");
dom.append("<div>start</div>");

oboe("articles.json").node('article.*', function(article) {
  dom.prepend("<div>"+article.text+"</div>");
});
