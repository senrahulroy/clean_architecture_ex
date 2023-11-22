import 'package:clean_architecture_ex/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_ex/features/daily_news/data/repository/article_repo_impl.dart';
import 'package:clean_architecture_ex/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture_ex/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_ex/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializaDependencies() async {
//Dio
  sl.registerSingleton<Dio>(Dio());

// Dependencies
  sl.registerSingleton<NewsApiServices>(
    NewsApiServices(sl()),
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRespositoryImpl(sl()),
  );

  //useCase
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  //bloc
  sl.registerSingleton<RemoteArticlesBloc>(
    RemoteArticlesBloc(sl()),
  );
}
