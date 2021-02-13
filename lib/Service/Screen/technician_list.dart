import 'package:flutter/material.dart';
import 'package:flutter_group_project/Widgets/category_item.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final images =['carpenter.jpg','mechanic.png','carpenter.jpg','mechanic.png','carpenter.jpg','mechanic.png'];
  final texts =['carpenter','mechanic','carpenter','mechanic','carpenter','mechanic'];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(6, (index) {
        return CategoryItem(image: images[index],text: texts[index],);
      }),

    );
  }
}
