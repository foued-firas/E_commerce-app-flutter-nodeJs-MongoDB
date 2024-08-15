
import 'package:amazon/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index ;
  const CartProduct({super.key, required this.index});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    final ProductCart =context.watch<UserProvider>().user.cart[
      widget.index
    ];
    final product =Product.fromMap(ProductCart['product']);
     return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
              product.images[0], 
              fit: BoxFit.cover,
              height: 135,
              width: 135,
              ),
              Column(children: [
                Container(
                  width: 235,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(product.name, style: TextStyle(fontSize: 16),
                  maxLines: 2,
                  ),
                ),
                
                Container(
                  width: 235,
                   padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text('\$${product.price}',
                   style: TextStyle(fontSize: 20,
                   fontWeight: FontWeight.bold,
                   ),
                  maxLines: 2,
                  ),
                ),
                Container(
                  width: 235,
                   padding: EdgeInsets.only(left: 10,),
                  child: Text(
                    'Eligible for FREE shipping'
                  ),
                ),
                Container(
                  width: 235,
                   padding: EdgeInsets.only(left: 10,),
                  child: const Text(
                    'In Stock ',
                    style: TextStyle(
                      color: Colors.teal
                    ),
               maxLines: 2,
                  ),
                ),
                
              ],)
              ]
            
          ),
        ),
      ],
    );
  }
}