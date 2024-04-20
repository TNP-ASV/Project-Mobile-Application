import 'package:flutter/material.dart';
import 'package:watchshop/CartPage.dart';
import 'package:watchshop/container_button_model.dart';

import '../test/container_button_model.dart';

class ProductDetailsPopUp extends StatelessWidget {
  final iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Color:",
                            style: iStyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Total:",
                            style: iStyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Silver",
                                style: iStyle,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "Gold",
                                style: iStyle,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "Rose-Gold",
                                style: iStyle,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text("-", style: iStyle),
                              SizedBox(width: 30),
                              Text("1", style: iStyle),
                              SizedBox(width: 30),
                              Text("+", style: iStyle),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Paymeny:",
                        style: iStyle,
                      ),
                      Text(
                        "\$30000.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 96, 57, 100),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    child: ContainerButtonModel(
                      containerWidth: MediaQuery.of(context).size.width,
                      itext: "Checkout",
                      bgColor: Color.fromRGBO(0, 96, 57, 100),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 2.5,
        itext: "BuyNow",
        bgColor: Color.fromRGBO(0, 96, 57, 100),
      ),
    );
  }
}
