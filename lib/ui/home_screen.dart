import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Photo> _photos = [];
  final TextEditingController _controller = TextEditingController();

  Future<List<Photo>> fetch(String query) async{
    String url = 'https://pixabay.com/api/?key=31513340-a3e2d13e307b941f062f336b9&q=$query&image_type=photo';

    final response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final photos = await fetch(_controller.text);
                    setState(() {
                      _photos = photos;
                    });
                  },
                  icon: const Icon(Icons.search),
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
                  return PhotoWidget(
                    photo: photo,
                  );
                }),
          ),
        ],
      ),
    );
  }
}