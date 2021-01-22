import 'package:flutter/material.dart';
import 'package:flutter_group_project/Widgets/category_item.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,

      children: [
        Row(
          children: [
            Expanded(child: CategoryItem(image: 'carpenter.jpg',text: 'Carpenter',)),
            Expanded(child: CategoryItem(image: 'mechanic.png',text: 'Mechanic',)),
          ],
        ),
        Row(
          children: [
            Expanded(child: CategoryItem(image: 'carpenter.jpg',text: 'Carpenter',)),
            Expanded(child: CategoryItem(image: 'mechanic.png',text: 'Mechanic',)),          ],
        ),
        Row(
          children: [
            Expanded(child: CategoryItem(image: 'carpenter.jpg',text: 'Carpenter',)),
            Expanded(child: CategoryItem(image: 'mechanic.png',text: 'Mechanic',)),          ],
        ),
      ],);
  }
}
