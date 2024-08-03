import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/account/widgets/below_app_bar.dart';
import 'package:amazon/featutres/account/widgets/orders.dart';
import 'package:amazon/featutres/account/widgets/top_bottons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              alignment: Alignment.topLeft,
              child:Image.asset(
                'assets/images/amazon_in.png',
              width: 120,
              height: 45,
              color: Colors.black,) ,
            ),
             Container(
              padding: EdgeInsets.only(right: 15, left: 15 ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_outlined),

                  ),
                  Icon(Icons.search),

                ],
              ),
              ) ,
            
           ]
          ),
        ),
      ),
    body: Column(
      children: const [
        BelowAppBar(),
        SizedBox(height: 10,),
        TopButtons(),
        SizedBox(height: 20,),
        Orders(),


      ],
    ),
    );
  }
}