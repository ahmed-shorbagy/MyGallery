import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/constants.dart';
import 'package:my_gallery/controller/cubit/get_images_cubit.dart';
import 'package:my_gallery/widgets/avatar_image.dart';
import 'package:my_gallery/widgets/options_buttons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFD0FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: [
                        TextSpan(
                            text: 'Welcome\n', style: TextStyle(fontSize: 32)),
                        TextSpan(text: 'Mina', style: TextStyle(fontSize: 32)),
                      ],
                    ),
                  ),
                  const AvatarImage(),
                ],
              ),
            ),
            const OptionsButtons(),
            BlocBuilder<GetImagesCubit, GetImagesState>(
              builder: (context, state) {
                if (state is GetImagesSuccess) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Image.asset(state.imagesUrl[index]);
                    },
                  );
                } else if (state is GetImagesFaluire) {
                  return Center(child: Text(state.erreMssage));
                } else {
                  return const Center(child: SizedBox());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
//i implemented every thins except for the getimages api that i couldnt implement and i dont have any acccess to api documentation 
//it always return a status code of 302 when i tried to get the images