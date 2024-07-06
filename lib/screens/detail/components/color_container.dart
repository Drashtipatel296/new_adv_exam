import 'package:flutter/material.dart';

Padding colorContainer() {
  return Padding(
    padding: const EdgeInsets.only(left: 20,top: 10),
    child: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.purple,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.pink,
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}