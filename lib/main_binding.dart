import 'package:clean_architecture_getx/data/datasource/api_data_source.dart';
import 'package:clean_architecture_getx/data/datasource/local_storage_data_source.dart';
import 'package:clean_architecture_getx/data/repositories/api_repository.dart';
import 'package:clean_architecture_getx/data/repositories/local_storage_repository.dart';
import 'package:clean_architecture_getx/domain/repositories/api_repository.dart';
import 'package:clean_architecture_getx/domain/repositories/local_storage_repository.dart';
import 'package:clean_architecture_getx/domain/usecases/login_usecase.dart';
import 'package:clean_architecture_getx/domain/usecases/user_usecase.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LocalStorageRepository>(() => LocalStorageRepositoryImpl(localStorageDataSource: LocalStorageDataSourceImpl()));
    Get.lazyPut<ApiRepository>(() => ApiRepositoryImpl(apiDataSource: ApiDataSourceImpl()));
    Get.lazyPut<UserUseCases>(()=> UserUseCases(localStorageRepository: LocalStorageRepositoryImpl(localStorageDataSource: LocalStorageDataSourceImpl())));
    Get.lazyPut<LoginUseCase>(()=> LoginUseCase(apiRepository: ApiRepositoryImpl(apiDataSource: ApiDataSourceImpl())));
  }
}