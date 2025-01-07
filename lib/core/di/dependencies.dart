import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_code_challenge/modules/home/data/api/post_repository_impl.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/post_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(getIt<http.Client>()),
  );
}
