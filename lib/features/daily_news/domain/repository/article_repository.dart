import 'package:clean_architecture_ex/core/resources/data_state.dart';
import 'package:clean_architecture_ex/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
