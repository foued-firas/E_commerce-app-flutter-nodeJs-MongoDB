import 'package:amazon/constants/utils.dart';
import 'package:amazon/featutres/address/services/address_services.dart';
import 'package:amazon/featutres/address/services/address_services.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:provider/provider.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({super.key, required this.totalAmount});
  static const String routeName = '\address';
  final String totalAmount;

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _adressFormKey = GlobalKey<FormState>();
  String addressToBeUsed="";
  final AddressServices addressServices =AddressServices();
   

  List<PaymentItem> paymentItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentItems.add(PaymentItem(amount: widget.totalAmount, label: 'Total Amount', status: PaymentItemStatus.final_price));
  }
  

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  void onApplePayResult(res) {
    if(Provider.of<UserProvider>(context).user.address.isEmpty){
      addressServices.saveUserAddress(context: context, address: addressToBeUsed);

    }
  }
  void onGooglePayPayResult(res) {}
  void payPressed(String addressFromProvider){
    addressToBeUsed="";

    bool isForm = 
    flatBuildingController.text.isNotEmpty || 
    areaController.text.isNotEmpty || 
    pincodeController.text.isNotEmpty || 
    cityController.text.isNotEmpty ;
    if(isForm){
      if(_adressFormKey.currentState!.validate()){
        addressToBeUsed ='${flatBuildingController.text}, ${areaController.text},${cityController.text} - ${pincodeController.text}';

      }else{
        throw('Please enter all the values !');
      } 
    }else if(addressFromProvider.isNotEmpty){
      addressToBeUsed =addressFromProvider;
    }
    else{
      showSnackBar(context , 'Error ');
    }
  }

  Future<PaymentConfiguration> loadPaymentConfiguration() async {
    try {
      String json = await DefaultAssetBundle.of(context).loadString('assets/gpay.json');
      print(json);  // Debug line to check if the file is loading
      return PaymentConfiguration.fromJsonString(json);
    } catch (e) {
      print('Error loading payment configuration: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('OR', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              ApplePayButton( // This works only on iOS
                width: double.infinity,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                paymentConfigurationAsset: 'applepay.json',
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 15),
                height: 50,
                onPressed: ()=>payPressed(address),
              ),

              const SizedBox(height: 10),
              //payement with google
              FutureBuilder<PaymentConfiguration>(
                future: loadPaymentConfiguration(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GooglePayButton(
                      onPressed: ()=> payPressed(address),
                      paymentConfiguration: snapshot.data!,
                      onPaymentResult: onGooglePayPayResult,
                      paymentItems: paymentItems,
                      height: 50,
                      width: double.infinity,
                      type: GooglePayButtonType.buy,
                      margin: const EdgeInsets.only(top: 15),
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error loading payment configuration');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
