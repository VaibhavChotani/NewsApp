import 'dart:convert';

import 'package:news/modals/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=1369cc55d5db4d41aa55b61609116d51";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            descriptiton: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
            // url : element["url"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String categorie) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$categorie&apiKey=1369cc55d5db4d41aa55b61609116d51";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            descriptiton: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
            // url : element["url"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
