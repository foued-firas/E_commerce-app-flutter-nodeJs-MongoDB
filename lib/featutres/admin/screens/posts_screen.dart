import 'package:amazon/common/widgets/loder.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/account/widgets/single_product.dart';
import 'package:amazon/featutres/admin/screens/add_product_screen.dart';
import 'package:amazon/featutres/admin/services/admin_services.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
    List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }
  void deleteProduct(Product product , int index){
    adminServices.deleteProduct(context: context, product: product, onSuccess: (){
      products!.removeAt(index);
      setState(() {
        
      });
    });

  }
  void navigateToAddProduct(){
    Navigator.pushNamed(context,AddProductScreen.routeName );
  }
  @override
  Widget build(BuildContext context) {
    return   products == null ?  const Loader() :Scaffold(
      body: GridView.builder(
        itemCount: products!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
        final productData = products![index];
        return Column(
          children: [
            SizedBox(
              height: 140,
              child: Single_Product(image: productData.images[0]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text(
                  productData.name, 
                  overflow:  TextOverflow.ellipsis, maxLines: 2
                )),
                IconButton(onPressed: ()=>deleteProduct(productData,index),
                 icon:Icon(Icons.delete_outline)),

              ],
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
         backgroundColor: GlobalVariables.selectedNavBarColor, 
        onPressed:
          navigateToAddProduct,
    
        tooltip: 'Add a Product',
        child:  const Icon(Icons.add),
     
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}