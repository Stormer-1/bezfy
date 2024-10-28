import 'package:bezfy/domain/models/article.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';



class NewsDetailsScreen extends StatelessWidget {
  static const routeName = '/newsDetails';

  const NewsDetailsScreen({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 200),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 48,
                  right: 150,
                  bottom: 40,
                  top: 350,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      article.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  article.title,
                ),
              ),
            ),
          ),
          title: Text(
            article.title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // gapH20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(article.description),
          ),
          Center(
            child: IconButton(
              onPressed: () async {
                Share.share(article.description);
              },
              icon: const Icon(Icons.ios_share),
            ),
          ),
        ],
      ),
    );
  }
}
