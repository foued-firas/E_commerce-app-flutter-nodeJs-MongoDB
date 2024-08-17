import 'package:amazon/common/widgets/loder.dart';
import 'package:amazon/featutres/account/widgets/orders.dart';
import 'package:amazon/featutres/account/widgets/single_product.dart';
import 'package:amazon/featutres/admin/services/admin_services.dart';
import 'package:amazon/featutres/order_details/screen/order_details.dart';
import 'package:amazon/models/oder.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order> orders =[];
  final AdminServices adminServices =AdminServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllOrders();
  }
  fetchAllOrders() async{
    adminServices.fetchAllOrders(context);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return orders ==null ? Loader() :
     GridView.builder(
      itemCount: orders.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context , index){
        final orderData = orders![index];
        return GestureDetector(
          onTap : (){
            Navigator.pushNamed(context, OrderDetailScreen.routeName,arguments: orderData);

          },
          child: SizedBox(
            height: 140,
            child: Single_Product(image: orderData.products[0].images[0],)
          ),
        );
      }
      );
  }
}