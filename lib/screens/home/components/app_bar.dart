import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.only(left: 8),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/img/pro.jpg'),
      ),
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hii..',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),),
        Text('Drashti Patel 👋',style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.all(12),
        child: Icon(Icons.person,size: 28,),
      ),
    ],
  );
}