import 'package:flutter/material.dart';
import 'package:watchshop/ProductPage.dart';
import 'package:watchshop/Searchpage.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/src/rendering/box.dart';

class HomePage extends StatelessWidget {
  static List<String> previousSearchItem = [];

  List<String> tabs = ["All", "Category", "Top", "Recommend"];
  List<String> imageList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
  ];

  List<String> productTitles = [
    "Rolex Oyster \nPerpetual",
    "Rolex Daytona \nWhite Gold",
    "Patek Philippe \nNautilus Gold",
  ];

  List prices = [
    "\$30000",
    "\$30000",
    "\$30000",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: TextFormField(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Searchpage()));
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color.fromRGBO(0, 96, 57, 100),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Search your Product",
                                  hintStyle: TextStyle(
                                    fontFamily: 'MateSC',
                                    color: Colors.black54,
                                    fontSize: 16, 
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 50,
                            //   width: MediaQuery.of(context).size.width / 6,
                            //   decoration: BoxDecoration(
                            //     color: Colors.black12.withOpacity(0.05),
                            //     borderRadius: BorderRadius.circular(10),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.black12,
                            //         blurRadius: 2,
                            //         spreadRadius: 1,
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        Container(
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: tabs.length,
                              itemBuilder: (context, index) {
                                return FittedBox(
                                    child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: FittedBox(
                                    child: Text(tabs[index],
                                        style: const TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'MateSC',
                                        )),
                                  )),
                                ));
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // color: Colors.white,
                          height: 200,
                          child: ListView.builder(
                            itemCount: imageList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                // height: 200,
                                width: 300,

                                margin: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductPage(),
                                                  ));
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                imageList[index],
                                                fit: BoxFit.cover,
                                                height: 250,
                                                width: 150,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Center(
                                                  child: Icon(Icons.favorite,
                                                      color: Color.fromRGBO(
                                                          0, 96, 57, 100))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                            width: 5,
                                          ),
                                          Text(
                                            productTitles[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'MateSC',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 120,
                                            child: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                            maxLines: 6,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'MateSC',
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12, 
                                            ),
                                          ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            prices[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'MateSC',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  0, 96, 57, 100),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Newest Products",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MateSC',
                            ),
                          ),
                        ),
                        GridView.builder(
                            itemCount: productTitles.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 200,
                                width: 200,
                                margin: const EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductPage(),
                                                  ));
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                imageList[index],
                                                fit: BoxFit.cover,
                                                height: 200,
                                                width: 200,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Center(
                                                  child: Icon(Icons.favorite,
                                                      color: Color.fromRGBO(
                                                          0, 96, 57, 100))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      productTitles[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                         fontFamily: 'MateSC',
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      prices[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'MateSC',
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(0, 96, 57, 100),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                      ],
                    )))));
                    
  }
}
