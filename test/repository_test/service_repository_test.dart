import 'package:flutter_group_project/Features/Service/Model/Service.dart';
import 'package:flutter_group_project/Features/Service/data_provider/data_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

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
    final service2 = Service(
        AdvancedPrice: 19,
        Category: "Mock Categoy",
        Description: 'Moek descrerj erkjke',
        id: 1,
        imageUrl: 'sdks',
        InitialPrice: 10,
        IntermediatePrice: 29,
        ServiceName: 'Mock Service2');
// final services = [service1, service2];
    ServiceDataProvider serviceDataProvider = MocServiceDataProvider();
    List<Service> services = [];
    test('Get all services', () async {
      when(serviceDataProvider.getServices()).thenAnswer((_) async {
        return services;
      });
      expect(services.length, 0);
    });

    test('create service', () async {
      when(serviceDataProvider.createService(service1)).thenAnswer((_) async {
        services.add(service1);
        return Future.value(service1);
      });
      expect(services.length, 0);
    });

    test('delete service', () async {
      when(serviceDataProvider.deleteService(service1.id))
          .thenAnswer((_) async {
        services.remove(service1);
        return Future.value(service1);
      });

      expect(services.length, 0);
    });
    test('update service', () async {
      when(serviceDataProvider.deleteService(service1.id))
          .thenAnswer((_) async {
        services.add(service2);
      });
      expect(services.length, 0);
    });
  });
}
