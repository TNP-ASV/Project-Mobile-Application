import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
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
          title: const Text(
            "Favorite",
            style: TextStyle(
              fontFamily: 'MateSC',
              fontSize: 24, 
            ),
          ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                // height: 200,
                child: ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                imageList[index],
                                fit: BoxFit.cover,
                                height: 140,
                                width: 140,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productTitles[index],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    fontFamily: 'MateSC',
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Oyster, 43 มม",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'MateSC',
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  prices[index],
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 96, 57, 100),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'MateSC',
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(31, 71, 71, 71),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Color.fromRGBO(0, 96, 57, 100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                          child: Image.asset("assets/images/logo.png"),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
