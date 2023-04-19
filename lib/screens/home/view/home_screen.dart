import 'package:api_call/screens/home/modal/home_modal.dart';
import 'package:api_call/screens/utiles/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Icon(
              Icons.menu_outlined,
              size: 40,
            ),
          ],
          elevation: 0,
          title: Text(
            "Movie Rating",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueGrey.shade900,
          bottom: Tab(
            child: Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: homeController.txtname,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Serch Movie",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      homeController.search();
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey.shade900,
                Colors.blueGrey.shade600,
                Colors.blueGrey.shade300,
              ],
            ),
          ),
          child: GetBuilder<HomeController>(
            builder: (controller) => FutureBuilder(
              future: Api_http().movirateing(
                  controller.name == "" ? "hera pheri" : "${controller.name}"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  HomeMoel h1 = snapshot.data;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                "${h1.d![1].i!.imageUrl}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Rank               : ${h1.d![0].rank}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Movie               : ${h1.d![0].l}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Actor, Actress : ${h1.d![0].s}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "category                 : ${h1.d![0].qid}",
                            style: TextStyle(
                              fontSize: 19.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Id                     : ${h1.d![0].id}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "relese date              : ${h1.d![0].y}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.hasError}"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
