import 'dart:convert';

import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/models/user.dart';
import 'package:amazon/providers/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:provider/provider.dart';

class AddressServices{
  void saveUserAddress({
    required BuildContext context ,
    required String address ,
    


   } )async{
    final userProvider =Provider.of<UserProvider>(context, listen: false);
    try{
      
      http.Response res = await http.post(Uri.parse('$uri/api/save-user-address',), 
       headers: {
        'Content-Type': 'application/json; charset=UTF-8',
           'x-auth-token': userProvider.user.token,
       },
       body:jsonEncode(
        {
          'address' :address ,
        }
       ) ,
       );

       httpErrorHandle(response: res, context: context,
        onSuccess: (){
         User user = userProvider.user.copyWith(
            address: jsonDecode(res.body)['address']
          );
          userProvider.setUserFromModel(user);
       },
       );
          }catch(e){
         showSnackBar(context, e.toString());
    }
  }

  //get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}