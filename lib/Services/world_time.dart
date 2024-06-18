import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time = ''; //the time in that location
  String flag; //url to an asset flag icon
  String url; // location url for the api endpoint
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'];

      // Parse the datetime string to DateTime object
      DateTime now = DateTime.parse(dateTime);

      // Adjust time with the offset
      if (offSet[0] == '-') {
        // Negative offset
        now = now.subtract(Duration(hours: int.parse(offSet.substring(1, 3))));
      } else {
        // Positive offset
        now = now.add(Duration(hours: int.parse(offSet.substring(1, 3))));
      }

      // Format the time using DateFormat
      time = DateFormat.jm().format(now);

      // Determine if it's daytime
      isDaytime = now.hour >= 6 && now.hour < 18;
    } catch (e) {
      print("Caught error: $e");
      time = "Couldn't find time data; connect to the internet";
    }
  }
}