import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadColorFromPrefs().then((color) {
      setState(() {
        forButtons = color;
      });
    });
  }

  void saveColorToPrefs(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedColor', color.value);
  }

  Future<Color> loadColorFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('selectedColor');
    return Color(colorValue ?? Colors.orange.value);
  }

  //get data from other page
  Map data = {};
  Color forButtons = Colors.orange;
  @override
  Widget build(BuildContext context) {
    //
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color iconsColor = data['isDaytime'] ? Colors.black : Colors.white;
    Color bgColor =
        data['isDaytime'] ? Colors.blue.shade400 : Colors.grey.shade900;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "World Time",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.settings),
          iconColor: iconsColor,
          onSelected: (String result) {
            // Handle the selected menu item
            if (result == "Orange") {
              setState(() {
                forButtons = Colors.orange;
                saveColorToPrefs(forButtons);
              });
            } else if (result == "Green") {
              setState(() {
                forButtons = Colors.greenAccent;
                saveColorToPrefs(forButtons);
              });
            } else if (result == "Cyan") {
              setState(() {
                forButtons = Colors.cyanAccent;
                saveColorToPrefs(forButtons);
              });
            } else {
              setState(() {
                forButtons = Colors.pinkAccent;
                saveColorToPrefs(forButtons);
              });
            }
            //print('Selected menu item: $result');
          },
          offset: Offset(0, 55),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            // Add PopupMenuItems for each menu item
            PopupMenuItem<String>(
              value: 'Orange',
              child: ListTile(
                title: Center(child: Text('Orange')),
                textColor: iconsColor,
                tileColor: Colors.orange,
              ),
            ),
            PopupMenuItem<String>(
              value: 'Green',
              child: ListTile(
                title: Center(child: Text('Green')),
                textColor: iconsColor,
                tileColor: Colors.greenAccent,
              ),
            ),
            PopupMenuItem<String>(
                value: 'Cyan',
                child: ListTile(
                  title: Center(child: Text('Cyan')),
                  textColor: iconsColor,
                  tileColor: Colors.cyanAccent,
                )),
            PopupMenuItem<String>(
              value: 'Pink',
              child: ListTile(
                title: Center(child: Text('Pink')),
                textColor: iconsColor,
                tileColor: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset("assets/world_time_logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: iconsColor,
                ),
                label: Text(
                  "Select Location",
                  style: TextStyle(
                    color: iconsColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor:
                      forButtons, // Set the background color to transparent
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  width: 140,
                  height: 70,
                  child: Image.asset("assets/" + data['flag'])),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: iconsColor,
                      fontFamily: 'SixtyfourRegular',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  data['time'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: data['time'] ==
                              "Coudn\'t find time data connect to internet"
                          ? 22
                          : 55.0,
                      color: data['time'] ==
                              "Coudn\'t find time data connect to internet"
                          ? Colors.red
                          : forButtons),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
