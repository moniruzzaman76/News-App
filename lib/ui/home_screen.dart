import 'package:flutter/material.dart';
import 'package:news_app/ui/all_news_screen.dart';
import 'package:news_app/ui/breaking_news_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF485E68),
            centerTitle: true,
            title: const Text('Flutter News App'),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Breaking News",),
                Tab(text: 'All News',)
              ],
            ),
          ),
          body:  const TabBarView(
            children: [
              BreakingNews(),
              AllNewsScreen(),
            ],
          ),
        ));
  }
}
