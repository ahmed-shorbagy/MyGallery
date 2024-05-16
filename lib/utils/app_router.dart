import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gallery/constants.dart';
import 'package:my_gallery/controller/cubit/get_images_cubit.dart';
import 'package:my_gallery/controller/cubit/log_in_cubit.dart';
import 'package:my_gallery/views/log_in_view.dart';
import 'package:my_gallery/views/main_view.dart';

abstract class AppRouter {
  static const String kMainView = '/MainView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LogInCubit(),
          ),
          BlocProvider(
            create: (context) => GetImagesCubit(),
          ),
        ],
        child: const LogInView(),
      ),
    ),
    GoRoute(
      path: kMainView,
      builder: (context, state) => BlocProvider(
        create: (context) => GetImagesCubit(),
        child: const MainView(),
      ),
    )
  ]);
}
