import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_services_module/src/feature/music/data/data_scource/service_ds.dart';
import 'package:music_services_module/src/feature/music/data/repository/service_repository.dart';
import 'package:music_services_module/src/feature/music/domain/repository/service_repository_impl.dart';
import 'package:music_services_module/src/feature/music/presentation/bloc/service_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<ServiceRemoteDataSource>(
      () => ServiceRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<ServiceRepository>(
      () => ServiceRepositoryImpl(sl()));

  sl.registerFactory(() => ServiceBloc(sl()));
}
