import '../../domain/model/service_model.dart';

abstract class ServiceRepository {
  Future<List<ServiceModel>> getServices();
}
