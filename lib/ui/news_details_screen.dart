import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatefulWidget {
 final ArticleModel articleModel;
  const NewsDetailScreen({Key? key, required this.articleModel}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.articleModel.title.toString()),
      ),
      body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        widget.articleModel.source!.name ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      "Published : ${widget.articleModel.publishedAt ?? ""}",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 7,),
                Text(
                  widget.articleModel.author == null
                      ? "Written by Unknown"
                      : "Written by ${widget.articleModel.author}",
                  style: const TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10,),
                Text(widget.articleModel.title ?? ""),
                const SizedBox(height: 10,),
                Text(widget.articleModel.description ?? ""),
                const SizedBox(height: 25,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: .1,
                          backgroundColor: Colors.white54,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                          onPressed: () async {
                            final Uri _url = Uri.parse(widget.articleModel.url.toString());
                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          }, child: const Text('Read more...',style: TextStyle(
                        color: Colors.black87,
                      ),)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
