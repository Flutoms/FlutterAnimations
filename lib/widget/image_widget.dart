import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final double imageHeight;

  const ImageWidget(
      {super.key, required this.image, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * imageHeight,
      width: size.width * 0.82,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image.network(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
