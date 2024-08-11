import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  final String category;
  static const String routeName='/category-deals';
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(50) ,
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration
            (
              gradient: GlobalVariables.appBarGradient,

            ) ,
          ) ,
         title: Text(widget.category,
         style: TextStyle(
          color: Colors.black,
         ),),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep shopping for ${widget.category}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),SizedBox(
            height: 170,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15),
              itemCount: 10,
              gridDelegate: 
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, 
              childAspectRatio: 1.4,
              mainAxisSpacing: 10
              ), itemBuilder: (context, index){
                return Text("hello");
              }),
          )
        ],
      ),


    );
  }
}