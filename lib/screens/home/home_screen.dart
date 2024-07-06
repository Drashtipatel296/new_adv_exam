import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_adv_exam/helper/api_service.dart';
import 'package:new_adv_exam/screens/detail/detail_screen.dart';
import 'package:provider/provider.dart';
import '../../controller/data_provider.dart';
import '../../model/data_model.dart';
import 'components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context, listen: true);

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: ApiService().apiCalling(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading data'),
              );
            } else if (snapshot.hasData) {
              List<dynamic> jsonData = jsonDecode(snapshot.data!);
              dataProvider.setData(jsonData);

              List<DataModel> dataModelList = dataProvider.dataModelList;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: Container(
                      height: 140,
                      width: 450,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/bg.png'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: Row(
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'See All',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  dataModelList.isEmpty
                      ? const Center(child: Text('No data available'))
                      : SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataModelList.length,
                      itemBuilder: (context, index) {
                        var product = dataModelList[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black,width: 1),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(product.image!),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'Recommended For You',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'See All',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  dataModelList.isEmpty
                      ? const Center(child: Text('No data available'))
                      : SizedBox(
                    height: 500,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.1,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dataModelList.length,
                      itemBuilder: (context, index) {
                        var product = dataModelList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(productIndex: index, dataModelList: dataModelList),),);
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 300,
                                width: 300,
                                color: Colors.black12,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // border: Border.all(color: Colors.grey,width: 0.8),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(product.image!),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
