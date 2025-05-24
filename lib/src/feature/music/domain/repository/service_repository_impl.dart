import '../../data/data_scource/service_ds.dart';
import '../../data/repository/service_repository.dart';
import '../model/service_model.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remoteDataSource;

  ServiceRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ServiceModel>> getServices() {
    return remoteDataSource.getServices();
  }
}
