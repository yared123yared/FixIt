import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String text;
  var width;
  var height;
  CategoryItem({this.image,this.text});
  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(5),
      width: width * 0.46875,
      height: height * 0.5,
      child: GestureDetector(
        onTap: (){
          print('I am tapped');
        },
        child: Card(
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          color: Colors.white70,
          child: Column(
            children: [
              Image.asset('assets/images/${image==null? 'electronics.jpg': image}' ,height: height* 0.3, width: width *0.6 ,),
              Padding(
                padding: const EdgeInsets.only(left:20.0,bottom: 10.0,top: 5.0),
                child: Row(
                  children: [
                    Text('${text==null? 'Electronics': text}',style: TextStyle(fontSize: 20.0),),
                    SizedBox(width: 20,),
                    Text('120')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
