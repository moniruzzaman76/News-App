import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';


class ApiService {
  final allNewsUrl = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=81ba334151a14b288f9525a6d40a2b4a";
  final breakingNewsUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=81ba334151a14b288f9525a6d40a2b4a";

  Future<List<ArticleModel>> getAllNews() async {
    try {
      final response = await get(Uri.parse(allNewsUrl));
      if (response.statusCode == 200) {

        Map<String, dynamic>json = jsonDecode(response.body);
        List<dynamic>body = json['articles'];
        List<ArticleModel> articleList = body.map((item) =>
            ArticleModel.fromJson(item)).toList();
        return articleList;
      } else {
        throw('No News found');
      }
    } catch (e) {
      throw(e.toString());
    }
  }

  Future<List<ArticleModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breakingNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<ArticleModel> articles =
        body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No News found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
