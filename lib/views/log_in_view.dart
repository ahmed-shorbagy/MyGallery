import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gallery/controller/cubit/get_images_cubit.dart';
import 'package:my_gallery/controller/cubit/log_in_cubit.dart';
import 'package:my_gallery/utils/app_router.dart';
import 'package:my_gallery/widgets/login_fields.dart';

import '../constants.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LogInCubit, LogInState>(
        listener: (context, state) async {
          if (state is LogInSucces) {
            await BlocProvider.of<GetImagesCubit>(context)
                .getImages(token: kTOekn);
            GoRouter.of(context).push(AppRouter.kMainView);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 2.1,
              colors: [
                Colors.pink.shade100,
                const Color(0xFFE8B5FF), // Light purple

                Colors.pink.shade100,

                Colors.purple.shade100,

                Colors.white
              ],
            ),
          ),
          child: Stack(children: [
            Positioned(
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.2,
                        left: 20,
                        child: Image.asset(
                          'assets/images/Rectangle 12.png', // Replace with your camera image path
                          scale: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: LoginFields(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text('My',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade800)),
                    Text('Gallery',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade800)),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Image.asset(
                      'assets/images/Vector 2012.png', // Replace with your camera image path
                      scale: 2,
                    ),
                  ),
                  Image.asset(
                    'assets/images/love_photography.png', // Replace with your camera image path
                    scale: 1,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
