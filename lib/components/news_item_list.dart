import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news_details_screen.dart';

class NewsItemList extends StatefulWidget {
  final ArticleModel articleModel;
  const NewsItemList({Key? key, required this.articleModel}) : super(key: key);

  @override
  State<NewsItemList> createState() => _NewsItemListState();
}

class _NewsItemListState extends State<NewsItemList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewsDetailScreen(articleModel: widget.articleModel)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical:6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.articleModel.urlToImage.toString(),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(11)),
                    child: Text(
                      widget.articleModel.source!.name ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Published : ${widget.articleModel.publishedAt ?? ""}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.articleModel.author == null
                  ? "Written by Unknown"
                  : "Written by ${widget.articleModel.author}",
              style: const TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.articleModel.title ?? ""),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
