import 'package:amazon/featutres/account/services/account_services.dart';
import 'package:amazon/featutres/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: (){}),
            AccountButton(text: 'Turn Seller', onTap: (){}),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          
          children: [
            AccountButton(text: 'Log Out', onTap: ()=> AccountServices().logOut(context)),
            AccountButton(text: 'Your Wish List', onTap: (){}),
          ],
        ),
      ],
    );
  }
}