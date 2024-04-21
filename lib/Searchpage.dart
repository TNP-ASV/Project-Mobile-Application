import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchshop/Homepage.dart';
import 'package:iconly/iconly.dart';
// import 'package:watchshop/Homepage.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          onEditingComplete: () {
                            HomePage.previousSearchItem.add(searchController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromRGBO(0, 96, 57, 100),
                            ),
                            hintText: "Search your Product",
                            hintStyle: const TextStyle(
                            fontFamily: 'MateSC',),
                            filled: true,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.cancel_sharp),
                              onPressed: () {
                                searchController.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Previous Search
              const SizedBox(height: 4),
            
              Container(
                color: Colors.white,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: HomePage.previousSearchItem.length,
                  itemBuilder: (context, index) => previousSearchItem(index)),
              ),

              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Search Suggestion",
                      style: TextStyle(
                      fontFamily: 'MateSC',
                      fontSize: 24, 
                    ),
                    ),
                    const SizedBox(
                      height: 24
                    ),
                    Row(
                      children: [
                        SearchSuggestionsItem("Audemars Piguet"),
                        SearchSuggestionsItem("IWC"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SearchSuggestionsItem("Rolex"),
                        SearchSuggestionsItem("Audemars Piguet"),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget previousSearchItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir){
            HomePage.previousSearchItem.removeAt(index);
          },
          child: Row(
            children: [
              const Icon(
                IconlyLight.time_circle,
                color: Colors.grey, // Assuming SecondaryText is a custom color
              ),
              const SizedBox(width: 10),
              Text(
                HomePage.previousSearchItem[index],
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black), // Assuming mainText is a custom color
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget SearchSuggestionsItem(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 209, 209, 209), borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
      ),
    );
  }
}