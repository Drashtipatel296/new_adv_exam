import 'package:flutter/material.dart';

import '../../model/data_model.dart';
import 'components/bottom_bar.dart';
import 'components/color_container.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen(
      {super.key, required this.productIndex, required this.dataModelList});

  int productIndex;
  List<DataModel> dataModelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.shopping_cart,size: 25,),
          ),
        ],
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(dataModelList[productIndex].image!),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 20),
              child: Text(
                dataModelList[productIndex].title.toString(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: [
                  const Icon(Icons.star,color: Colors.yellow,),
                  const Icon(Icons.star,color: Colors.yellow,),
                  const Icon(Icons.star,color: Colors.yellow,),
                  const Icon(Icons.star,color: Colors.yellow,),
                  const SizedBox(width: 10,),
                  Text(dataModelList[productIndex].rating!.rate.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Text(
                '\$ ${dataModelList[productIndex].price}',
                style: const TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Colours available',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            colorContainer(),
            const SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('About',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Text(
                dataModelList[productIndex].description.toString(),
                style: TextStyle(fontSize: 16,color: Colors.grey.shade600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Divider(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}