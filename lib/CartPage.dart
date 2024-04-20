import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchshop/container_button_model.dart';

class CartPage extends StatelessWidget {
  List imageList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
  ];

  List productTitles = [
    "Rolex Oyster \nPerpetual",
    "Rolex Daytona \nWhite Gold",
    "Patek Philippe \nNautilus Gold"
  ];

  List prices = [
    "\$30000",
    "\$30000",
    "\$30000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                // height: 200,
                child: ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              splashRadius: 30,
                              activeColor: Color.fromRGBO(0, 96, 57, 100),
                              value: true,
                              onChanged: (val) {},
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                imageList[index],
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productTitles[index],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "Oyster, 43 มม",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  prices[index],
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 96, 57, 100),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Color.fromRGBO(0, 96, 57, 100),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                  Checkbox(
                    splashRadius: 20,
                    activeColor: Colors.black87,
                    value: false,
                    onChanged: (val) {},
                  ),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  ),
                  ),
                  Text(
                    "\$30000",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(0, 96, 57, 100),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: (){},
                child: ContainerButtonModel(
                  itext: "Checkout",
                  containerWidth: MediaQuery.of(context).size.width,
                  bgColor: Color.fromRGBO(0, 96, 57, 100),
                  ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
