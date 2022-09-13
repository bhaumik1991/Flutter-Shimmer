import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../widget/shimmer_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var isDataBeingFetched = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      setState((){
        isDataBeingFetched = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isDataBeingFetched == false ? const ShimmerList()
            : ListView.builder(
            itemCount: 20,
            itemBuilder: (context, position){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: InkWell(
                    onTap: (){
                      print("Tapped");
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(position.toString()),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
      ),
    );
  }
}
