import 'package:flutter/material.dart';
import 'package:image_search_clean/data/provider.dart';
import 'package:image_search_clean/model/photo.dart';
import 'package:image_search_clean/ui/widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoProvider = PhotoProvider.of(context);
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
                  onPressed: () async {
                    photoProvider.fetch(_controller.text);
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
          StreamBuilder<List<Photo>>(
              stream: photoProvider.photoStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final photos = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: photos.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return PhotoWidget(photo: photo);
                      }),
                );
              })
        ],
      ),
    );
  }
}
