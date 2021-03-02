import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../ip_address.dart';
import '../Service.dart';


class ServiceDataProvider {
  final _baseUrl = IpAdress.ipAddress;
  final http.Client httpClient;
  Util util=  new Util();
  ServiceDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Service> createService(Service service) async {
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/api/services'),
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
//    print("this is the dataprovider getService method");
//    Response response = await get(Uri.encodeFull('http://192.168.137.1:5000/Service'));
   try{
//     print("try catch method");
     final response = await http.get('$_baseUrl/api/services');
     if (response.statusCode == 200) {
//       print("geting the service method completed successfully");
       final services = jsonDecode(response.body) as List;
//       print("This is the comming service api $services");
       return services.map((service) => Service.fromJson(service)).toList();
     } else {
//       print("geting service from remote server failed");
       throw Exception('Failed to load courses');
     }
   }catch(e){
     print("Exception throuwn $e");
    }


  }

  Future<void> deleteService(int  id) async {
    print("This is the delete method");
    print("Id of service to be deleted $id");

    final http.Response response = await http.delete(
      '$_baseUrl/api/services/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete course.');
    }

  }

  Future<void> updateService(Service service) async {
    String token = await util.getUserToken();
    final http.Response response = await httpClient.put(
      '$_baseUrl/api/services/',
//      headers: <String, String>{
//        'Content-Type': 'application/json; charset=UTF-8',
//      },

      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "serviceId":service.id,
        "serviceName": service.ServiceName,
        "description": service.Description,
        "category": service.Category,
        "initialPrice": service.InitialPrice,
        "intermediatePrice":service.IntermediatePrice,
        "advancedPrice":service.AdvancedPrice,

      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update course.');
    }
  }
}
