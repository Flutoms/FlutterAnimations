import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page_enter_animation.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.animationController})
      : homePageEnterAnimation = HomePageEnterAnimation(animationController),
        super(key: key);

  final AnimationController animationController;
  final HomePageEnterAnimation homePageEnterAnimation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: AnimatedBuilder(
            animation: homePageEnterAnimation.controller,
            builder: (context, child) => Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    TopBarWidget(size: homePageEnterAnimation.barHeight.value),
                    ProfileCenter(
                        size: size,
                        animationValue:
                            homePageEnterAnimation.avatarSize.value),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 60),
                        Opacity(
                          opacity: homePageEnterAnimation.titleOpacity.value,
                          child: const PlaceHolder(
                              alignment: Alignment.centerLeft,
                              height: 28,
                              width: 150),
                        ),
                        const SizedBox(height: 8),
                        Opacity(
                          opacity: homePageEnterAnimation.textOpacity.value,
                          child: const PlaceHolder(
                              alignment: Alignment.centerLeft,
                              height: 350,
                              width: double.infinity),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

class PlaceHolder extends StatelessWidget {
  const PlaceHolder(
      {Key? key,
      required this.alignment,
      required this.height,
      required this.width})
      : super(key: key);

  final Alignment alignment;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300),
      ),
    );
  }
}

class ProfileCenter extends StatelessWidget {
  const ProfileCenter({
    Key? key,
    required this.size,
    required this.animationValue,
  }) : super(key: key);

  final Size size;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 200,
        left: (size.width - 100) / 2,
        child: Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.diagonal3Values(animationValue, animationValue, 1.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue.shade700),
            )));
  }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: double.infinity,
      color: size <= 30 ? Colors.transparent : Colors.blue,
    );
  }
}
