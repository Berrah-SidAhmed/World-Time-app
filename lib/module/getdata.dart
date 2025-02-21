import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {
  String countryName;
  String flag;
  String link;
  AllCountries({
    required this.link,
    required this.countryName,
    required this.flag,
  });

  late String mytime;
  late String real;

  getdata() async {
    Response data = await get(
      Uri.parse(
        "http://api.timezonedb.com/v2.1/get-time-zone?key=NCI0SQH469AE&format=json&by=zone&zone=$link",
      ),
    );

    Map mydata = jsonDecode(data.body);
    DateTime realtime = DateTime.parse(mydata["formatted"]);
    mytime = DateFormat('hh:mm a').format(realtime);
    String mytime2 = DateFormat.Hm().format(realtime);
    real = mytime2.substring(0, 2);
  }
}
