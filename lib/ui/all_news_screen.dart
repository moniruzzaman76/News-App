import 'package:flutter/material.dart';
import 'package:news_app/api_service/api_service.dart';
import 'package:news_app/components/news_item_list.dart';

import '../model/news_model.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future:apiService.getAllNews(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<ArticleModel> articleModel = snapshot.data??[];
            return ListView.builder(
              itemCount: articleModel.length,
                itemBuilder: (context,index){
                return NewsItemList(
                    articleModel: articleModel[index]
                );
                }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
