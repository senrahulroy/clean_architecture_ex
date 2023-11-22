import 'dart:io';

import 'package:clean_architecture_ex/core/constants/const.dart';
import 'package:clean_architecture_ex/core/resources/data_state.dart';
import 'package:clean_architecture_ex/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_ex/features/daily_news/data/models/article_model.dart';
import 'package:clean_architecture_ex/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRespositoryImpl implements ArticleRepository {
  final NewsApiServices _newsApiServices;

  ArticleRespositoryImpl(this._newsApiServices);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpsResponse = await _newsApiServices.getNewArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpsResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpsResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpsResponse.response.statusMessage,
              response: httpsResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpsResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
