
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:time_app/module/getdata.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

String link2 = "Africa/Luanda";
//AllCountries data = AllCountries(link: "Tunisia - Tunis", countryName: "tounis", flag: 'assets/sa.png');

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    //  info about time
      AllCountries oneCountry =
        AllCountries(countryName: "Egypt", flag: "egypt", link: "Africa/Cairo");

    await oneCountry.getdata();

    Navigator.pushReplacementNamed(context, '/second', arguments: {
      "time": oneCountry.mytime,
      "location": oneCountry.countryName,
    
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SpinKitPulsingGrid(color: Colors.black, size: 80)],
        ),
      ),
    );
  }
}
