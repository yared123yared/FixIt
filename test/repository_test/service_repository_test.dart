import 'package:flutter_group_project/Features/Service/Data_provider/Service_data.dart';
import 'package:flutter_group_project/Features/Service/Model/Service.dart';
import 'package:flutter_group_project/Features/Service/Repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MocServiceDataProvider extends Mock implements ServiceDataProvider {}

main() {
  group('service repository test', () {
    final service1 = Service(
        AdvancedPrice: 19,
        Category: "Mock Categoy",
        Description: 'Moek descrerj erkjke',
        id: 1,
        imageUrl: 'sdks',
        InitialPrice: 10,
        IntermediatePrice: 29,
        ServiceName: 'Mock Service1');

    ServiceDataProvider serviceDataProvider = MocServiceDataProvider();
    ServiceRepository serviceRepository =
        ServiceRepository(dataProvider: serviceDataProvider);
//     List<Service> Services = [];
    test('get all Services', () async {
      when(serviceRepository.getServices()).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.getServices();

      verify(serviceRepository.getServices()).called(1);
    });

    test('create Service', () async {
      when(serviceRepository.createService(service1)).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.createService(service1);

      verify(serviceRepository.createService(service1)).called(1);
    });

    test('delete Service', () async {
      when(serviceRepository.deleteService(service1.id)).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.deleteService(service1.id);

      verify(serviceRepository.deleteService(service1.id)).called(1);
    });

    test('update Service', () async {
      when(serviceRepository.updateService(service1)).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.updateService(service1);

      verify(serviceRepository.updateService(service1)).called(1);
    });
  });
}
