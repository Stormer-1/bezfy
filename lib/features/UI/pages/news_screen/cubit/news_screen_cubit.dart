import 'package:bezfy/domain/models/article.dart';
import 'package:bezfy/domain/repositories/filter/filter_repo.dart';
import 'package:bezfy/domain/repositories/news/abstract_news_repository.dart';
import 'package:bezfy/domain/repositories/news/mock_news_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  final AbstractNewsRepository repository = MockNewsRepository();

  NewsScreenCubit() : super(const NewsScreenInitial()) {
    _getArticles();
  }

  void _getArticles() async {
    try {
      emit(
        NewsScreenLoading(
          latestArticles: state.latestArticles,
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      final latest = await repository.getLatestArticles();
      emit(
        NewsScreenSuccess(
          latestArticles: latest,
          filter: FilterEnums.all,
        ),
      );
    } catch (e) {
      emit(
        NewsScreenError(
          latestArticles: state.latestArticles,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void toggleFilter(FilterEnums filter) async {
    if (state is! NewsScreenSuccess) return;
    final articles = filter == FilterEnums.all
        ? await repository.getFeaturedArticles()
        : await repository.getFilteredArticles(filter);
    emit(
      NewsScreenSuccess(
        latestArticles: articles,
        filter: filter,
      ),
    );
  }

  void searchArticles(String searchText) async {
    if (state is! NewsScreenSuccess) return;
    emit(
      NewsScreenSuccess(
        latestArticles: await repository.searchArticles(searchText),
        filter: (state as NewsScreenSuccess).filter,
      ),
    );
  }
}
