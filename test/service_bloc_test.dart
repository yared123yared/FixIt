import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_group_project/Features/Service/service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockServiceRepository extends Mock implements ServiceRepository {}

void main() {
  test('throws AssertionError if ServiceRepository is null', () {
    expect(
      () => ServiceBloc(serviceRepository: null),
      throwsA(isAssertionError),
    );
  });

  ServiceRepository serviceRepository = MockServiceRepository();
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
  final services = [service1, service2];

  blocTest(
    'getServices [ServiceLoading, ServiceLodingSuccess] when successful',
    build: () {
      when(serviceRepository.getServices()).thenAnswer((_) async => services);
      return ServiceBloc(serviceRepository: serviceRepository);
    },
    act: (bloc) => bloc.add(ServiceLoad()),
    expect: [ServiceLoading(), ServicesLoadSuccess(services)],
  );
  blocTest(
    'createService [ServiceLoading, ServiceLodingSuccess] when successful',
    build: () {
      when(serviceRepository.createService(service1))
          .thenAnswer((_) async => service1);
      return ServiceBloc(serviceRepository: serviceRepository);
    },
    act: (bloc) => bloc.add(ServiceLoad()),
    expect: [ServiceLoading(), ServicesLoadSuccess(services)],
  );
  blocTest(
    'deleteService [ServiceLoading, ServiceLodingSuccess] when successful',
    build: () {
      when(serviceRepository.deleteService(service1.id))
          .thenAnswer((_) async => {});
      return ServiceBloc(serviceRepository: serviceRepository);
    },
    act: (bloc) => bloc.add(ServiceLoad()),
    expect: [ServiceLoading(), ServicesLoadSuccess(services)],
  );
  blocTest(
    'updateService [ServiceLoading, ServiceLodingSuccess] when successful',
    build: () {
      when(serviceRepository.updateService(service1))
          .thenAnswer((_) async => {});
      return ServiceBloc(serviceRepository: serviceRepository);
    },
    act: (bloc) => bloc.add(ServiceLoad()),
    expect: [ServiceLoading(), ServicesLoadSuccess(services)],
  );
}
