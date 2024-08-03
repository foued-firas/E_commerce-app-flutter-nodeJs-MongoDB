import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List list = [
    
    'https://plus.unsplash.com/premium_photo-1721276303391-ee0af231d021?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzN3x8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1671439543718-9e4d009827e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGN8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1671439543718-9e4d009827e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGN8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1671439543718-9e4d009827e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGN8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1671439543718-9e4d009827e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGN8ZW58MHx8MHx8fDA%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text('Your Orders',style: TextStyle(
                fontSize: 18,
              fontWeight: FontWeight.w600,
              ),),
            ),
              Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'See All',style: TextStyle(
               color: GlobalVariables.selectedNavBarColor,
              ),),
            ),
            //display orders
          
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10 , top: 20 , right: 0 ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length ,
            itemBuilder: (context , index ) {
              return Single_Product(image: list[index]);
            }  ),

        )
      ],
    );
  }
}