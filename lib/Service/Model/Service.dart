import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';




@immutable
class Service extends Equatable{
  final  int  id;
  final String ServiceName;
  final String Description;
  final String Category;
  final String imageUrl;
  final int InitialPrice;
  final int IntermediatePrice;
  final int AdvancedPrice;



  const Service({
    @required this.id,
    @required this.ServiceName,
    @required this.imageUrl ,
    @required this.Description ,
    @required this.Category,
    @required this.InitialPrice ,
    @required this.IntermediatePrice ,
    @required this.AdvancedPrice,


  });

  @override
  List<Object> get props => [id, ServiceName, imageUrl, Description, Category,InitialPrice,IntermediatePrice,AdvancedPrice];

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['serviceId'],
      ServiceName: json['ServiceName'],
      imageUrl: json['imageUrl'],
      Description: json['Description'],
      Category: json['Category'],
      InitialPrice: json['InitialPrice'],
      IntermediatePrice: json['IntermediatePrice'],
      AdvancedPrice: json['AdvancedPrice'],
    );
  }

  @override
  String toString() => 'Service { id: $id, ServiceName: $ServiceName, Description: $Description }';
}


