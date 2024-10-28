
import 'package:bezfy/domain/models/article.dart';
import 'package:bezfy/domain/repositories/filter/filter_repo.dart';

abstract class AbstractNewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<List<Article>> getFilteredArticles(FilterEnums filter);
  Future<List<Article>> searchArticles(String filter);
  Future<Article> getArticle(String id);
}
