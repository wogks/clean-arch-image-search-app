import 'package:flutter/cupertino.dart';
import 'package:image_search_clean/model/photo.dart';

class PhotoWidget extends StatefulWidget {
  Photo photo;
  PhotoWidget({Key? key, required this.photo}) : super(key: key);

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              widget.photo.previewURL),
        ),
      ),
    );
  }
}
