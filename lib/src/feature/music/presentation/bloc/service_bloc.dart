import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/service_repository.dart';
import '../../domain/model/service_model.dart';
import 'service_event.dart';
import 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository repository;

  ServiceBloc(this.repository) : super(ServiceInitial()) {
    on<LoadServicesEvent>(_onLoadServices);
  }

  Future<void> _onLoadServices(
    LoadServicesEvent event,
    Emitter<ServiceState> emit,
  ) async {
    emit(ServiceLoading());
    try {
      final List<ServiceModel> services = await repository.getServices();
      emit(ServiceLoaded(services));
    } catch (e) {
      emit(ServiceError("Failed to load services: ${e.toString()}"));
    }
  }
}
