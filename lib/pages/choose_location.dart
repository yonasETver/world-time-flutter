import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';

class ChoosLocation extends StatefulWidget {
  const ChoosLocation({Key? key}) : super(key: key);

  @override
  State<ChoosLocation> createState() => _ChoosLocationState();
}

class _ChoosLocationState extends State<ChoosLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: "Abidjan", flag: "cotdivoire.gif", url: "Africa/Abidjan"),
    WorldTime(
        location: "Addis Ababa",
        flag: "ethiopia.gif",
        url: "Africa/Addis_Ababa"),
    WorldTime(location: "Algiers", flag: "algeria.gif", url: "Africa/Algiers"),
    WorldTime(location: "Almaty", flag: "kazakhstan.gif", url: "Asia/Almaty"),
    WorldTime(location: "Amman", flag: "jordan.gif", url: "Asia/Amman"),
    WorldTime(location: "Andorra", flag: "andorra.gif", url: "Europe/Andorra"),
    WorldTime(
        location: "Araguaina", flag: "brazil.gif", url: "America/Araguaina"),
    WorldTime(
        location: "Ashgabat", flag: "turkmenistan.gif", url: "Asia/Ashgabat"),
    WorldTime(
        location: "Asuncion", flag: "paraguay.gif", url: "America/Asuncion"),
    WorldTime(location: "Athens", flag: "greece.gif", url: "Europe/Athens"),
    WorldTime(location: "Baghdad", flag: "iraq.gif", url: "Asia/Baghdad"),
    WorldTime(location: "Beirut", flag: "lebanon.gif", url: "Asia/Beirut"),
    WorldTime(location: "Bahia", flag: "brazil.gif", url: "America/Bahia"),
    WorldTime(location: "Bangkok", flag: "thailand.gif", url: "Asia/Bangkok"),
    WorldTime(location: "Beirut", flag: "lebanon.gif", url: "Asia/Beirut"),
    WorldTime(
        location: "Bahia Banderas",
        flag: "mexico.gif",
        url: "America/Bahia_Banderas"),
    WorldTime(
        location: "Barbados", flag: "barbados.gif", url: "America/Barbados"),
    WorldTime(location: "Belgrade", flag: "serbia.gif", url: "Europe/Belgrade"),
    WorldTime(location: "Berlin", flag: "germany.gif", url: "Europe/Berlin"),
    WorldTime(
        location: "Bermuda", flag: "bermuda.png", url: "Atlantic/Bermuda"),
    WorldTime(
        location: "Bissau", flag: "ginea_bissau.gif", url: "Africa/Bissau"),
    WorldTime(
        location: "Boa Vista", flag: "brazil.gif", url: "America/Boa_Vista"),
    WorldTime(location: "Bogota", flag: "colombi.gif", url: "America/Bogota"),
    WorldTime(
        location: "Brussels", flag: "belgium.gif", url: "Europe/Brussels"),
    WorldTime(
        location: "Budapest", flag: "hungary.gif", url: "Europe/Budapest"),
    WorldTime(
        location: "Buenos Aires",
        flag: "argentina.gif",
        url: "America/Argentina/Buenos_Aires"),
    WorldTime(location: "Cairo", flag: "egypt.gif", url: "Africa/Cairo"),
    WorldTime(
        location: "Cambridge Bay",
        flag: "canada.gif",
        url: "America/Cambridge_Bay"),
    WorldTime(
        location: "Campo Grande",
        flag: "belize.gif",
        url: "America/Campo_Grande"),
    WorldTime(location: "Cancun", flag: "mexico.gif", url: "America/Cancun"),
    WorldTime(
        location: "Caracas", flag: "venezuela.gif", url: "America/Caracas"),
    WorldTime(
        location: "Casablanca", flag: "moroco.gif", url: "Africa/Casablanca"),
    WorldTime(location: "Chicago", flag: "usa.gif", url: "America/Chicago"),
    WorldTime(
        location: "Costa_Rica",
        flag: "costarica.gif",
        url: "America/Costa_Rica"),
    WorldTime(location: "Cuiaba", flag: "belize.gif", url: "America/Cuiaba"),
    WorldTime(location: "Damascus", flag: "syria.gif", url: "Asia/Damascus"),
    WorldTime(
        location: "Danmarkshavn",
        flag: "denmark.gif",
        url: "America/Danmarkshavn"),
    WorldTime(location: "Dawson", flag: "usa.gif", url: "America/Dawson"),
    WorldTime(
        location: "Dawson Creek", flag: "usa.gif", url: "America/Dawson_Creek"),
    WorldTime(location: "Denver", flag: "usa.gif", url: "America/Denver"),
    WorldTime(location: "Dhaka", flag: "bangladesh.gif", url: "Asia/Dhaka"),
    WorldTime(location: "Dili", flag: "india.gif", url: "Asia/Dili"),
    WorldTime(location: "Dubai", flag: "uae.gif", url: "Asia/Dubai"),
    WorldTime(location: "Dublin", flag: "ireland.gif", url: "Europe/Dublin"),
    WorldTime(
        location: "El Salvador",
        flag: "el_salvador.gif",
        url: "America/El_Salvador"),
    WorldTime(location: "Gaza", flag: "gaza.gif", url: "Asia/Gaza"),
    WorldTime(
        location: "Guatemala", flag: "guatemala.gif", url: "America/Guatemala"),
    WorldTime(
        location: "Guayaquil", flag: "ecuador.gif", url: "America/Guayaquil"),
    WorldTime(location: "Guyana", flag: "guyana.gif", url: "America/Guyana"),
    WorldTime(location: "Havana", flag: "cuba.gif", url: "America/Havana"),
    WorldTime(
        location: "Helsinki", flag: "finland.gif", url: "Europe/Helsinki"),
    WorldTime(location: "Hong-Kong", flag: "china.gif", url: "Asia/Hong_Kong"),
    WorldTime(location: "Istanbul", flag: "turkey.gif", url: "Europe/Istanbul"),
    WorldTime(location: "Jakarta", flag: "indonesia.gif", url: "Asia/Jakarta"),
    WorldTime(location: "Jamaica", flag: "jamaica.gif", url: "America/Jamaica"),
    WorldTime(location: "Jerusalem", flag: "israel.gif", url: "Asia/Jerusalem"),
    WorldTime(
        location: "Johannesburg",
        flag: "south_africa.gif",
        url: "Africa/Johannesburg"),
    WorldTime(location: "Juba", flag: "south_sudan.gif", url: "Africa/Juba"),
    WorldTime(location: "Kabul", flag: "afganistan.gif", url: "Asia/Kabul"),
    WorldTime(
        location: "Kaliningrad", flag: "russia.gif", url: "Europe/Kaliningrad"),
    WorldTime(location: "Khartoum", flag: "sudan.gif", url: "Africa/Khartoum"),
    WorldTime(location: "Kyiv", flag: "ukraine.gif", url: "Europe/Kyiv"),
    WorldTime(location: "Lagos", flag: "nigeria.gif", url: "Africa/Lagos"),
    WorldTime(location: "Lisbon", flag: "portugal.gif", url: "Europe/Lisbon"),
    WorldTime(location: "London", flag: "london.gif", url: "Europe/London"),
    WorldTime(
        location: "Los Angeles", flag: "usa.gif", url: "America/Los_Angeles"),
    WorldTime(location: "Madrid", flag: "spain.gif", url: "Europe/Madrid"),
    WorldTime(location: "Malta", flag: "spain.gif", url: "Europe/Malta"),
    WorldTime(location: "Manila", flag: "philippines.gif", url: "Asia/Manila"),
    WorldTime(location: "Maputo", flag: "mozambique.gif", url: "Africa/Maputo"),
    WorldTime(
        location: "Melbourne",
        flag: "australia.gif",
        url: "Australia/Melbourne"),
    WorldTime(
        location: "Mexico_City",
        flag: "mexico.gif",
        url: "America/Mexico_City"),
    WorldTime(location: "Minsk", flag: "belarus.gif", url: "Europe/Minsk"),
    WorldTime(location: "Monrovia", flag: "libiya.gif", url: "Africa/Monrovia"),
    WorldTime(location: "Moscow", flag: "russia.gif", url: "Europe/Moscow"),
    WorldTime(location: "Nairobi", flag: "kenya.gif", url: "Africa/Nairobi"),
    WorldTime(location: "Ndjamena", flag: "chad.gif", url: "Africa/Ndjamena"),
    WorldTime(location: "New York", flag: "usa.gif", url: "America/New_York"),
    WorldTime(location: "Panama", flag: "panama.gif", url: "America/Panama"),
    WorldTime(location: "Paris", flag: "france.gif", url: "Europe/Paris"),
    WorldTime(location: "Prague", flag: "parguay.gif", url: "Europe/Prague"),
    WorldTime(
        location: "Puerto Rico",
        flag: "panama.gif",
        url: "America/Puerto_Rico"),
    WorldTime(location: "Pyongyang", flag: "dprk.gif", url: "Asia/Pyongyang"),
    WorldTime(location: "Qatar", flag: "qatar.gif", url: "Asia/Qatar"),
    WorldTime(location: "Riyadh", flag: "saudi_arabia.gif", url: "Asia/Riyadh"),
    WorldTime(location: "Rome", flag: "italy.gif", url: "Europe/Rome"),
    WorldTime(
        location: "San Luis",
        flag: "argentina.gif",
        url: "America/Argentina/San_Luis"),
    WorldTime(
        location: "Sao Paulo", flag: "brazil.gif", url: "America/Sao_Paulo"),
    WorldTime(
        location: "Sao Tome", flag: "sao_tome.gif", url: "Africa/Sao_Tome"),
    WorldTime(location: "Seoul", flag: "south_korea.gif", url: "Asia/Seoul"),
    WorldTime(location: "Shanghai", flag: "china.gif", url: "Asia/Shanghai"),
    WorldTime(
        location: "Sydney", flag: "australia.gif", url: "Australia/Sydney"),
    WorldTime(location: "Taipei", flag: "taiwan.png", url: "Asia/Taipei"),
    WorldTime(location: "Tehran", flag: "iran.gif", url: "Asia/Tehran"),
    WorldTime(location: "Tokyo", flag: "japan.gif", url: "Asia/Tokyo"),
    WorldTime(location: "Tripoli", flag: "libiya.gif", url: "Africa/Tripoli"),
    WorldTime(location: "Tunis", flag: "tunisia.gif", url: "Africa/Tunis"),
    WorldTime(location: "Toronto", flag: "canada.gif", url: "America/Toronto"),
    WorldTime(
        location: "Vancouver", flag: "canada.gif", url: "America/Vancouver"),
    WorldTime(location: "Warsaw", flag: "poland.gif", url: "Europe/Warsaw"),
    WorldTime(
        location: "Windhoek", flag: "namibiya.gif", url: "Africa/Windhoek"),
    WorldTime(
        location: "Zurich", flag: "switzerland.gif", url: "Europe/Zurich"),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var count = 0;
    print('built function ran');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text('Choose a Location',
              style: TextStyle(
                color: Colors.white,
              )),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      //print(locations[index].location);
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${locations[index].flag}"),
                    ),
                  ),
                ),
              );
            }));
  }
}
