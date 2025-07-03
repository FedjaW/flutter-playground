import 'dart:convert';

import 'package:coincap/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService? http;

  @override
  void initState() {
    super.initState();
    http = GetIt.instance.get<HttpService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [dataWidgets()],
        ),
      ),
    );
  }

  Widget recipeTile(String name) {
    return Text(name);
  }

  Widget dataWidgets() {
    return FutureBuilder(
      future: http!.get("/recipes/f291ae07-1f42-4b55-9c5a-11735bef8281"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map data = jsonDecode(snapshot.data.toString());
          String recipeName = data["title"];
          return recipeTile(recipeName);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
