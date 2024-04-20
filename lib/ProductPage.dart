import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:watchshop/product_details_popup.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProductPage extends StatelessWidget {
  List<String> images = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FanCarouselImageSlider(
                    sliderHeight: 430,
                    autoPlay: true,
                    imagesLink: images,
                    isAssets: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Rolex Oyster Perpetual",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Submariner",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "\$30000",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromRGBO(0, 96, 57, 100)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "นาฬิกาสำหรับนักดำน้ำโดยแท้จริงในฐานะเครื่องมือเพื่อการอยู่รอดใต้น้ำนาฬิกาเรือนนี้ได้รับการออกแบบมาเพื่อตอบสนองต่อความต้องการของนักดำน้ำโดยเฉพาะ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(31, 71, 71, 71),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Color.fromRGBO(0, 96, 57, 100),
                        ),
                        
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(31, 71, 71, 71),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: Color.fromRGBO(0, 96, 57, 100),
                        ),
                        
                      ),
                    ),
                    ProductDetailsPopUp(),
                  ],
                ),
                
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}
