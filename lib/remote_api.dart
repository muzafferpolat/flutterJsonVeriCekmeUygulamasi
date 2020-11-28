import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsoncekimi/models/soruModeli.dart';
import 'dart:async';
import 'dart:convert';

class RemoteApiKullanimi extends StatefulWidget {
  @override
  _RemoteApiKullanimiState createState() => _RemoteApiKullanimiState();
}

class _RemoteApiKullanimiState extends State<RemoteApiKullanimi> {
  Soru soru;
  Future<List<Soru>> _soruGetir() async {
    var response = await http
        .get("https://muzafferpolat.github.io/jsonislemleri/sorubankam.json");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Soru.fromJson(e))
          .toList();
    } else {
      throw Exception("Bağlanamadık");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _soruGetir(),
        builder: (BuildContext context, AsyncSnapshot<List<Soru>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].soruMetni),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
