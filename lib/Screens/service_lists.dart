import 'package:flutter/material.dart';
import 'package:flutter_group_project/Widgets/category_item.dart';
class ServiceList extends StatefulWidget {



  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Row(
          children: [
            Expanded(child: CategoryItem(image: 'electronics.jpg',)), Expanded(child: CategoryItem(image: 'mitad.jpg',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: CategoryItem(image: 'electronics.jpg',)), Expanded(child:CategoryItem(image: 'mitad.jpg',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: CategoryItem(image: 'electronics.jpg',)), Expanded(child:CategoryItem(image: 'mitad.jpg',)),
          ],
        ),
      ],);}}