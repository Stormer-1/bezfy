part of 'news_screen_cubit.dart';

@immutable
sealed class NewsScreenState {
  final List<Article> latestArticles;

  const NewsScreenState({
    required this.latestArticles,
  });
}

final class NewsScreenInitial extends NewsScreenState {
  const NewsScreenInitial({
    super.latestArticles = const [],
  });
}

final class NewsScreenLoading extends NewsScreenState {
  const NewsScreenLoading({
    required super.latestArticles,
  });
}

final class NewsScreenSuccess extends NewsScreenState {
  final FilterEnums filter;

  const NewsScreenSuccess({
    required super.latestArticles,
    this.filter = FilterEnums.all,
  });
}

final class NewsScreenError extends NewsScreenState {
  final String errorMessage;

  const NewsScreenError({
    required this.errorMessage,
    required super.latestArticles,
  });
}
