import 'package:flutter/material.dart';
import 'package:flutter_group_project/Widgets/category_item.dart';
class ServiceList extends StatefulWidget {



  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
    final images =['mitad.jpg','electronics.jpg','mitad.jpg','electronics.jpg','mitad.jpg','electronics.jpg'];
    final texts =['mitad','electronics.','mitad','electronics','mitad','electronics'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GridView.count(
          crossAxisCount: 2,
        children: List.generate(6, (index) {
          return CategoryItem(image: images[index],text: texts[index] ,);
        }),
      ),
    );



  }}