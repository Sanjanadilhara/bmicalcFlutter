import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppMain(),
    );
  }
}

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

String _character = "male";
String _gender = "female";

class _AppMainState extends State<AppMain> {
  final TextEditingController _txtController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  String dt = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text("User Info"),
          backgroundColor: Color.fromARGB(180, 3, 144, 244),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("lib/back.jpg"))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              color: Color.fromARGB(196, 239, 250, 255),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            2,
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Color.fromARGB(72, 161, 161, 161))),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(252, 255, 255, 255)),
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          label: const Text("Name"),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            2,
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Color.fromARGB(72, 161, 161, 161))),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(252, 255, 255, 255)),
                    child: TextField(
                      controller: _address,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          label: const Text("Address"),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            2,
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Color.fromARGB(72, 161, 161, 161))),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(252, 255, 255, 255)),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          label: const Text("Date of Birth"),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      controller: _txtController,
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.parse("18000101"),
                            lastDate: DateTime.parse("20500101"));

                        setState(() {
                          dt = date == null
                              ? ""
                              : (DateTime.now().difference(date).inDays ~/ 365)
                                  .toString();

                          if (date != null) {
                            _txtController.text =
                                "${date.year} - ${date.month} - ${date.day}";
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('female'),
                    leading: Radio<String>(
                      groupValue: _gender,
                      value: "female",
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('male'),
                    leading: Radio<String>(
                      groupValue: _gender,
                      value: "male",
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            2,
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Color.fromARGB(72, 161, 161, 161))),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(252, 255, 255, 255)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _weight,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          label: const Text("Weight (kg)"),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            2,
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Color.fromARGB(72, 161, 161, 161))),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(252, 255, 255, 255)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _height,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          label: const Text("Height (cm)"),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(180, 3, 144, 244))),
                      onPressed: () {
                        TextStyle ts = TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15);

                        double bmi = double.parse(_weight.text) /
                            ((double.parse(_height.text) / 100) *
                                (double.parse(_height.text) / 100));

                        String comment = "";
                        if (bmi < 18) {
                          comment = "you are underweight !";
                        } else if (bmi >= 18.0 && bmi <= 24.0) {
                          comment = "you are healthy !";
                        } else {
                          comment = "you are overweight !";
                        }

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(255, 192, 236, 255),
                                    title: Text("Details"),
                                    content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name: " + _name.text,
                                            style: ts,
                                          ),
                                          Text("Address: " + _address.text,
                                              style: ts),
                                          Text("Gender: " + _gender, style: ts),
                                          Text("Age: " + dt, style: ts),
                                          Text("BMI: " + bmi.toStringAsFixed(2),
                                              style: ts),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            comment,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 28, 153, 0)),
                                          )
                                        ]),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ]));
                      },
                      child: const Text("submit",
                          style: TextStyle(color: Colors.black)))
                ],
              ),
            ),
          ),
        ));
  }
}
