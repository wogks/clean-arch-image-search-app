import 'package:flutter/material.dart';
import 'package:image_search_clean/ui/home_screen.dart';
import 'package:image_search_clean/ui/widget/home_view_model.dart';
import 'package:provider/provider.dart';

import 'data/pixabay_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        child: const HomeScreen(),
      ),
    );
  }
}
