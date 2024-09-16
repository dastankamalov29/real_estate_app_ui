import 'package:flutter/material.dart';
import 'package:real_estate_app_ui/models/real_estate_model.dart';
import 'package:real_estate_app_ui/styles/colors.dart';

import '../styles/const.dart';
import 'house_detail_screen.dart';

class HomeScreenRealState extends StatefulWidget {
  const HomeScreenRealState({super.key});

  @override
  State<HomeScreenRealState> createState() => _HomeScreenRealStateState();
}

class _HomeScreenRealStateState extends State<HomeScreenRealState> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    headerPart(),
                    const SizedBox(height: 20),
                    searchPart(),
                    const SizedBox(height: 10),
                    banner(size),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: realEstateModel.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final house = realEstateModel[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HouseDetailScreen(house: house,),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: size.width,
                            height: 290,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: 210,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            house.image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 5,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "\$${house.price}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: "/month",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          house.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 15,
                                              color: Colors.lightBlue,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              house.place,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1,
                                        ),
                                      ),
                                      child: Transform.rotate(
                                        angle: -45,
                                        child: const Icon(
                                          Icons.arrow_downward_outlined,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack banner(Size size) {
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 110,
          decoration: BoxDecoration(
            color: bannerColor1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GET YOUR 10% \n CASHBACK",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Expired 20 Apr 2022",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: bannerColor2,
          ),
        ),
        Positioned(
          right: -1,
          child: Image.network(
            "https://r2.erweima.ai/imgcompressed/compressed_0ce6b73ab0ec56a5fc2d433f2fd2a509.webp",
            height: 200,
          ),
        ),
      ],
    );
  }

  Padding searchPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for dream home",
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Row headerPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black54,
            ),
          ),
        ),
        Column(
          children: [
            Text("Current Location", style: headlineStyle2),
            const Row(
              children: [
                Icon(Icons.location_on_sharp, color: Colors.blue, size: 20),
                Text("Melbourne, Aus"),
              ],
            ),
          ],
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              size: 30,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
