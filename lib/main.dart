import 'package:flutter/material.dart';
import 'package:my_gallery/views/log_in_view.dart';

void main() {
  runApp(const MYGalleryApp());
}

class MYGalleryApp extends StatelessWidget {
  const MYGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LogInView(), theme: ThemeData(fontFamily: "Segoe UI"));
  }
}
