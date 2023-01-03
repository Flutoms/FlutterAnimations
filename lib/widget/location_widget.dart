import 'package:flutter/material.dart';

import 'expanded_content_widget.dart';
import 'image_widget.dart';

class LocationWidget extends StatefulWidget {
  final String image;

  const LocationWidget({super.key, required this.image});

  @override
  LocationWidgetState createState() => LocationWidgetState();
}

class LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;
  var imageHeight = .65;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.6 : size.height * 0.5,
            child: const ExpandedContentWidget(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 160 : 100,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              onTap: () {},
              child: ImageWidget(image: widget.image, imageHeight: imageHeight),
            ),
          ),
        ],
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
        imageHeight = 0.58;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
        imageHeight = 0.65;
      });
    }
  }
}
