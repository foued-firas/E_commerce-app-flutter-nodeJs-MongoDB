import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const  String routeName ='/add_product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController =TextEditingController();
    final TextEditingController descriptionController =TextEditingController();
      final TextEditingController priceController =TextEditingController();
        final TextEditingController quantityController =TextEditingController();

        String category ='Mobiles';

        @override
        void dispose(){
          super.dispose();
          productNameController.dispose();
          descriptionController.dispose();
          priceController.dispose();
         quantityController.dispose();

        }
        List<String> productCategories =[
          "Mobiles",
          "Essentials",
          "Appliances",
          "Books",
          "Fashion",

        ];


  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(50) ,
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration
            (
              gradient: GlobalVariables.appBarGradient,

            ) ,
          ) ,
         title: Center(
          
           child: Padding(
            padding: EdgeInsets.only(top: 10,),
             child: Text(
              "Add Product" , style: TextStyle(color: Colors.black),
             ),
           ),
         ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 10,),
                DottedBorder(
                 borderType: BorderType.RRect,
                 radius: Radius.circular(10),
                 dashPattern: [10,4],
                 strokeCap: StrokeCap.round,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
            
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_open,size: 40,),
                      SizedBox(height: 15,),
                      Text("Select Product Images", style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400
            
                      ),)
                    ],
                  ),
                )
              ),
              SizedBox(height: 30,),
              CustomTextField(
                controller: productNameController, 
                hintText: "Product Name"),
                const SizedBox(height: 10,),
                CustomTextField(
                controller: descriptionController, 
                hintText: "Description Name",
                maxLines: 7,
                ),
                SizedBox(height: 10,),
                 CustomTextField(
                controller: priceController, 
                hintText: "Price"),
                  SizedBox(height: 10,),
                 CustomTextField(
                controller: quantityController, 
                hintText: "quantity"),
                 SizedBox(height: 10,),

                 SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                  value: category,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: 
                    productCategories.map((String item){
                      return DropdownMenuItem(
                        value: item,
                        child:Text(item));
                    }).toList(),
                    onChanged: (String? newVal){
                      setState(() {
                        category=newVal!;
                      });
                    } ,
                  ),
                    ),
                    SizedBox(height: 10,),
                    CustomButton(text: 'Sell', onTap: (){}),

              ],
            ),
          )
        ),
      ),
    );
  }
}