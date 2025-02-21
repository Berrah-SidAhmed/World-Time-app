import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map : data ;
    return Scaffold(
      //extendBodyBehindAppBar: false,
      backgroundColor: Colors.blue.shade100,
      //  appBar: AppBar(title: Text("Page 2"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade300,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      offset: Offset(0, 3),
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    data["time"],
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // picture or lottie annimation
              Center(
                child: LottieBuilder.asset(
                  "assets/day.json",
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),

              // buttom
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(23),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade700,
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async{
                      dynamic result =
                      await Navigator.pushNamed(context, '/third');
                  
                  setState(() {
                      if (result == null) {
                        data = {
                      "time": "...",
                      "location": "Please Choose a location ✋",
                      "isDayTime": false 
                      // I CAN HOLD ANY THINK 
                      
                    };
                      } else {
                        data = {
                      "time": result["time"],
                      "location": result["location"],
                      "isDayTime": result["isDayTime"]
                    };
                      }




                    
                  });
                    },
                    child: Center(
                      child: Text(
                        "Click to change",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
