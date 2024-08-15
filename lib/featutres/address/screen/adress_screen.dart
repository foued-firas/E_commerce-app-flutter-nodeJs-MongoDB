import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({super.key});
 static const String routeName ='\address';
  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _adressFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();


  }
  
 
  @override
  Widget build(BuildContext context) {
    var address = '101 Fake Street';
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(60) ,
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration
            (
              gradient: GlobalVariables.appBarGradient,

            ) ,
          ) ,
        )
      ),
    body:   SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          children: [
            if(address.isNotEmpty)
            Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    )
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      address, style:TextStyle(
                      fontSize: 18,
                    
                    )),
                  ) ,

                ),
                SizedBox(height: 20,),
                Text('OR', style: TextStyle(
                  fontSize: 18
                ),),
                 SizedBox(height: 20,),
              ],
            ),
            Form(
                            key: _adressFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: flatBuildingController,
                                  hintText: 'Flat, House no , Building',
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  controller: areaController,
                                  hintText: 'Area , Street',
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  controller: pincodeController,
                                  hintText: 'Pincode',
                                ),
                                CustomTextField(
                                  controller: cityController,
                                  hintText: 'Town/City',
                                ),
                                const SizedBox(height: 10),
                               
                              ],
                            ),
                          ),
          ],
        ),
      ),
    ),
                );
            

    
  }
}