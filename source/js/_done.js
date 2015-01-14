$ = require("jquery");
oboe = require("oboe");

dom = $("#articles");
dom.append("<div>start</div>");

oboe("articles.json").done(function(data) {
  data.article.map(function(article) {
    dom.prepend("<div>"+article.text+"</div>");
  }
  )
})
