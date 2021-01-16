import 'package:flutter/material.dart';

class Service{
  final  int  id;
  final  String title;
  final String imageUrl;
  final int categoryId;
  final String description;


  const Service({@required this.id,@required this.title,@required this.imageUrl , @required this.description , @required this.categoryId});
}

