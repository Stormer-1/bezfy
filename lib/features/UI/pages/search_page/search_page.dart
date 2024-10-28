import 'package:bezfy/assets/app_sizes.dart';
import 'package:bezfy/domain/models/article.dart';
import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/drawer/main_drawer.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/search_field.dart/search_field.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/news_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const routeName = '/';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text("The Moscow Post"),
            Text(
              "Умеренный взгляд на сложные веши",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black54,
      ),
      drawer: const MainDrawer(),
      body: ListView(
        children: [
          gapH8,
          const SearchField(),
          gapH4,
          BlocBuilder<NewsScreenCubit, NewsScreenState>(
            builder: (context, state) => switch (state) {
              NewsScreenInitial() => const SizedBox(),
              NewsScreenLoading() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              NewsScreenSuccess(
                latestArticles: List<Article> latestArticles,
              ) =>
                Column(
                  children: List.generate(
                    latestArticles.length,
                    (index) => NewsFeed(
                      article: latestArticles[index],
                    ),
                  ),
                ),
              _ => const SizedBox(),
            },
          ),
        ],
      ),
    );
  }
}
