import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:nikhil_ui/newpage.dart';

void main() {
  runApp(const MyApp());
}

Color kPrimaryColor = const Color.fromRGBO(49, 87, 110, 1.0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Automated Irrigation System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime _dateSTime;
  late DateTime _dateETime;



  Widget buildTextField3() =>
      TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          prefixIcon: const Icon(Icons.calendar_view_day, color: Colors.blue),
          hintText: "Days",
          hintStyle: const TextStyle(color: Colors.blue),
          filled: true,
          fillColor: Colors.blue[50],
        ),
      );

  Widget buildTextField2() =>
      TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          prefixIcon: const Icon(Icons.timelapse, color: Colors.blue),
          hintText: "HH:MM:SS",
          hintStyle: const TextStyle(color: Colors.blue),
          filled: true,
          fillColor: Colors.blue[50],
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        elevation: .1,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      child: const Text(
                        'Start Time',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Time",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      child: const Text(
                        'End Time',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Time",
                        selectableDayPredicate: (date) {
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }
                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kPrimaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewPage()),
                );
              },
              child: Text(
                'SET',
                style: TextStyle(fontSize: size.width *0.08),
              ),
            )
          ],
        ),
      ),
    );
  }
}
