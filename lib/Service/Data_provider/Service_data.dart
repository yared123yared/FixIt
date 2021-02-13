import 'dart:convert';
import 'package:flutter_group_project/Service/Model/Service.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class ServiceDataProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  ServiceDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Service> createService(Service service) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/Service'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, dynamic>{
        "serviceName": service.ServiceName,
        "description": service.Description,
        "category": service.Category,
        "initialPrice": service.InitialPrice,
        "intermediatePrice":service.IntermediatePrice,
        "advancedPrice":service.AdvancedPrice,

      }),
    );

    if (response.statusCode == 200) {
      return Service.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Service>> getServices() async {
    final response = await httpClient.get('$_baseUrl/Service');

    if (response.statusCode == 200) {
      final services = jsonDecode(response.body) as List;
      return services.map((service) => Service.fromJson(service)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteService(int  id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/Service/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateService(Service service) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/Service/${service.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "serviceName": service.ServiceName,
        "description": service.Description,
        "category": service.Category,
        "initialPrice": service.InitialPrice,
        "intermediatePrice":service.IntermediatePrice,
        "advancedPrice":service.AdvancedPrice,

      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}
