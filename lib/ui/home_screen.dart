import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search_clean/model/photo.dart';
import 'package:image_search_clean/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final _controller = TextEditingController();
  List<Photo> _photos = [];

  Future<List<Photo>> fetch (String query) async {
    final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=28871499-c75df118d01f09e96aaf02d60&q=$query&image_type=photo&pretty=true'),);
      Map<String, dynamic> json = jsonDecode(response.body);

      Iterable hits = json['hits'];

      return hits.map((e) => Photo.fromJson(e)).toList();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '이미지 검색앱',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async{
                    final photos = await fetch(_controller.text);
                    setState(() {
                      _photos = photos;
                    });

                  },
                  icon: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
                itemCount: _photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final photo = _photos[index];
                  return PhotoWidget(photo: photo);
                }),
          )
        ],
      ),
    );
  }
}