// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                BigText(
                  text: 'Ethiopia', 
                  color: Color.fromARGB(255, 80, 174, 218),
                  size: 30,),
                Row(
                  children: [
                    SmallText(
                  text: 'Addis Ababa',
                  color: Colors.black54,),
                  Icon(Icons.arrow_drop_down_rounded)
                  ],
                )
                ],
              ),
              Center(
                child: Container(
                  width: Dimensions.height45,
                  height: Dimensions.height45,
                  child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: Color.fromARGB(255, 80, 174, 218),
                  ),
                ),
              )
            ],
          ),
        )),
        Expanded(child: SingleChildScrollView(
          child: FoodPageBody(),
          )
          ),      
      ],
    ));
  }
}
