import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void navigateToAddProduct(){
    Navigator.pushNamed(context,AddProductScreen.routeName );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
         backgroundColor: GlobalVariables.selectedNavBarColor,
        child: Icon(Icons.add ,), 
        onPressed:
          navigateToAddProduct,
    
        tooltip: 'Add a Product',
     
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}