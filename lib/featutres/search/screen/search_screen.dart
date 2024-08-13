import 'package:amazon/common/widgets/loder.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/home/widgets/address_box.dart';
import 'package:amazon/featutres/products_details/screens/product_details_screen.dart';
import 'package:amazon/featutres/search/services/search_services.dart';
import 'package:amazon/featutres/search/widget/search_product.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  static const String routeName='/Search-screen';
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void navigateToSearchScreen(String query){
        Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);

  }
  List<Product>? products;
  final SearchServices searchServices =SearchServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchProduct();
  }
  fetchSearchProduct()async{
    products = await searchServices.fetchSearchProduct(context: context, searchQuery: widget.searchQuery);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: PreferredSize(

        preferredSize: const Size.fromHeight(60) ,
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration
            (
              gradient: GlobalVariables.appBarGradient,

            ) ,
          ) ,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child:Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: (){},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(Icons.search, color: Colors.black,size: 23,),),

                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7),),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7),),
                        borderSide: BorderSide(color: Colors.black38, width: 1),
                      ),
                      hintText: 'Search Amazon.In',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      )
                    ),
                  ),
                 ) ,
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 42,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.mic , color: Colors.black,size: 25,),


            ),
             
            
           ]
          ),
        ),
      ),
      body: products==null ? Loader(): Column(
       children: [
        AddressBox(),
        SizedBox(height: 10,),
        Expanded(child: ListView.builder(
          itemCount: products!.length,
          itemBuilder: (context, index){
            return GestureDetector
            
            (
              onTap: (){
                Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: products![index]);
              },
              child: SearchProduct(
                product: products![index],
                ));
          },
          

        ))

       ],
      ),
    );
  }
}