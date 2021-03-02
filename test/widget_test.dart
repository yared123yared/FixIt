import 'package:flutter_group_project/Features/Job/repository/job_repository.dart';
import 'package:flutter_group_project/Features/Role/repository/role_repository.dart';
import 'package:flutter_group_project/Features/Service/Repository/Service_repository.dart';
import 'package:flutter_group_project/Features/User/Repository/User_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group_project/main.dart';
import 'package:mockito/mockito.dart';

class MockRoleRepository extends Mock implements RoleRepository {}

class MockJobRepository extends Mock implements JobRepository {}

class MockServiceRepository extends Mock implements ServiceRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  final ServiceRepository serviceRepository = MockServiceRepository();
  final JobRepository jobRepository = MockJobRepository();
  final RoleRepository roleRepository = MockRoleRepository();

  testWidgets('Fixit Title test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FixIt(jobRepository: jobRepository,roleRepository: roleRepository,serviceRepository: serviceRepository,));
    // tester.
    // expect(find.byElementType(MyApp), findsOneWidget);
    // expect(find.text('1'), findsNothing);
  });
}
