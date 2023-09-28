import 'package:flutter/material.dart';
import '../api_service/api_service.dart';
import '../api_service/url.dart';
import '../components/news_item_list.dart';
import '../model/news_model.dart';


class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getRequest(Urls.allNewsUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ArticleModel> articleModel = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articleModel.length,
              itemBuilder: (context, index) {
              return NewsItemList(
                articleModel: articleModel[index],
              );
            },);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}