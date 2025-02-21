import 'package:flutter/material.dart';
import 'package:time_app/module/getdata.dart';

// ignore: must_be_immutable
class Location extends StatelessWidget {
  Location({super.key});
 List<AllCountries> allCountries = [
    AllCountries(link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'assets/egypt.png'),
    AllCountries(link: 'Africa/Tunis', countryName: 'Tunisia - Tunis', flag: 'assets/tunisia.png'),
    AllCountries(link: 'Africa/Algiers',countryName: 'Algeria - Algiers', flag: 'assets/algeria.png'),
    AllCountries(link: 'Australia/Sydney', countryName: 'Australia - Sydney', flag: 'assets/australia.png'),
    AllCountries(link: 'America/Toronto', countryName: 'Canada - Toronto',flag: 'assets/canada.png'),
    AllCountries(link: 'Asia/Riyadh', countryName: '	Saudi Arabia - Riyadh', flag: 'assets/sa.png'),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        
        child: ListView.builder(
          itemCount: allCountries.length,
          itemBuilder: (BuildContext a, int index) {
            return GestureDetector(
              onTap: () async{
    AllCountries clickedCountry = allCountries[index];

                    await clickedCountry.getdata();
                    Navigator.pop(context, {
                      "time": clickedCountry.mytime,
                      "location": clickedCountry.countryName,
                    
                    });
              
              },
              child: Card(
                child: ListTile(
                  title: Text(allCountries[index].countryName),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(allCountries[index].flag, width: 500),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
