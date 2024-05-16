import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/errors/simple_bloc_observer.dart';
import 'package:my_gallery/utils/app_router.dart';
import 'package:my_gallery/views/log_in_view.dart';

void main() {
  runApp(const MYGalleryApp());
  Bloc.observer = SimpleBLocObserver();
}

class MYGalleryApp extends StatelessWidget {
  const MYGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(fontFamily: "Segoe UI"));
  }
}
