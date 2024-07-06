import 'package:flutter/material.dart';
import 'package:new_adv_exam/screens/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 650,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/first.png'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 330,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                'Find The Best Fashion Style For You',
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),),);
                },
                child: Container(
                  height: 55,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xffFCCD00),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
