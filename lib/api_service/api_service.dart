import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';


class ApiService {
  Future<List<ArticleModel>> getRequest(String url) async {
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {

        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> articlesJson = json['articles'];

        List<ArticleModel> articleList = [];

        for (var articleJson in articlesJson) {
          articleList.add(ArticleModel.fromJson(articleJson));
        }
        return articleList;

      } else {
        throw('No News found');
      }
    } catch (e) {
      throw(e.toString());
    }
  }

}
