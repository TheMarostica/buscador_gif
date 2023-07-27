import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _search;

  final int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(Uri.parse("https://api.giphy.com/v1/gifs/trending?api_key=j4B1OekU0uG2K6z0A1kq07tOe2jx9CY2&limit=20&offset=0&rating=g&bundle=messaging_non_clips"));
    } else {
      response = await http.get(Uri.parse("https://api.giphy.com/v1/gifs/search?api_key=j4B1OekU0uG2K6z0A1kq07tOe2jx9CY2&q=$_search&limit=20&offset=$_offset&rating=g&lang=en&bundle=messaging_non_clips"));
    }

    return json.decode(response.body);
  }

  @override
  void initState(){
    super.initState();

    _getGifs().then((map) { // quando ele pegar os gifs ele vai chamar essa função
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
