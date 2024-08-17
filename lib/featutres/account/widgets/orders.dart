import 'package:amazon/common/widgets/loder.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/account/services/account_services.dart';
import 'package:amazon/featutres/account/widgets/single_product.dart';
import 'package:amazon/featutres/order_details/screen/order_details.dart';
import 'package:amazon/models/oder.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final AccountServices accountServices =AccountServices();

 List<Order>?orders;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }
  void fetchOrders() async {
    orders =await accountServices.fetchMyOrders(context: context);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return orders ==null ? Loader() : Column(
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
            itemCount: orders!.length ,
            itemBuilder: (context , index ) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, OrderDetailScreen.routeName, arguments :orders![index],);
                } ,
                child: Single_Product(image:
                 orders![index].products[0].images[index]),
              );
            }  ),

        )
      ],
    );
  }
}