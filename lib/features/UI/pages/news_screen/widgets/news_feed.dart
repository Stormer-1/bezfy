import 'package:bezfy/assets/app_sizes.dart';
import 'package:bezfy/domain/models/article.dart';
import 'package:bezfy/features/UI/pages/news_screen/news_details/news_details_screen.dart';
import 'package:flutter/material.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(article: article),
          ),
        );
      },
      child: SizedBox(
        height: 100,
        child: Card(
          margin: const EdgeInsets.only(left: 5, top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 8,
          child: Row(
            children: [
              // article image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
                child: Image.network(
                  article.imageUrl,
                  height: 100,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, trace) =>
                      const Icon(Icons.image),
                  loadingBuilder: (context, child, chunk) => chunk == null
                      ? child
                      : Container(
                          height: 16,
                          width: 16,
                          margin: const EdgeInsets.all(8),
                          child: const CircularProgressIndicator.adaptive(),
                        ),
                ),
              ),
              // article tile and publication date
              Expanded(
                child: _TextContents(article: article),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextContents extends StatelessWidget {
  const _TextContents({
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 2),
      child: SizedBox(
        width: 330,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // article title
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH4,
            // publication date
            Text(
              article.description,
              style: const TextStyle(fontSize: 7),
            ),
            spacer,
            Row(
              children: [
                Icon(article.icon, size: 10),
                gapW2,
                Text(
                  article.category,
                  style: const TextStyle(fontSize: 10),
                ),
                spacer,
                Icon(article.icon, size: 10),
                gapW2,
                Text(
                  '${article.viewCount}',
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
