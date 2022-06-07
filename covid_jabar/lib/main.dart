import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:covid_jabar/model/contact_list_model.dart';
import 'dashboard2.dart';
import 'tes.dart';

void main() async{
  initiateLocalDB();
  await Hive.openBox<ContactListModel>("contact_list");
  runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactListModelAdapter());
  await Hive.openBox<ContactListModel>("contact_list");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard2(),
    );
  }
}
