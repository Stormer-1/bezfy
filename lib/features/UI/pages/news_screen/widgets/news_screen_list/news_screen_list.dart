import 'package:bezfy/assets/app_sizes.dart';
import 'package:bezfy/domain/models/article.dart';
import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/filter_view.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/news_feed.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/news_of_the_hour/news_of_the_hour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreenList extends StatelessWidget {
  const NewsScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          gapH4,
          const NewsOfTheHour(),
          gapH8,
          const FilterView(),
          // gapH8,
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
      );
  }
}