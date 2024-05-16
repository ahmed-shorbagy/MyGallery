import 'package:flutter/material.dart';
import 'package:my_gallery/constants.dart';
import 'package:my_gallery/utils/Api_service.dart';

class OptionsButtons extends StatelessWidget {
  const OptionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () async {
              await ApiService().getImages(token: kTOekn);
            },
            child: Row(
              children: [
                Stack(children: [
                  Image.asset("assets/images/Vector.png"),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 9,
                    child:
                        Center(child: Image.asset("assets/images/image4.png")),
                  ),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )),
        ElevatedButton(
            onPressed: () async {
              await ApiService().uploadImage();
            },
            child: Row(
              children: [
                Image.asset("assets/images/Group 14.png"),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Upload",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
