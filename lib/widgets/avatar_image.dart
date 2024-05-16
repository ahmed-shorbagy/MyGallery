import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(
              "assets/images/Ellipse 1641.png",
            ),
            fit: BoxFit.contain,
            alignment: Alignment.center),
      ),
    );
  }
}
