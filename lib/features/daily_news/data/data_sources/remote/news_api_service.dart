import 'package:clean_architecture_ex/core/constants/const.dart';
import 'package:clean_architecture_ex/features/daily_news/data/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseURL)
abstract class NewsApiServices {
  factory NewsApiServices(Dio dio) = _NewsApiServices;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
