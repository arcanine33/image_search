import 'package:flutter/material.dart';
import 'package:image_search/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  const PhotoWidget({required this.photo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(photo.previewURL))),
    );
  }
}
