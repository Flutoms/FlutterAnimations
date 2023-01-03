import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  late Timer timer;

  var imageList = [
    'https://images.unsplash.com/photo-1662018107670-78f874d8faf3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc2fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1622086674545-1346776dfef5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29ya3NwYWNlJTIwc2V0dXB8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1622086674522-79a0089e9d02?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1530893609608-32a9af3aa95c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1625655164422-a954607ebca4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1601656269222-fda862e6dc7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njh8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1595675024853-0f3ec9098ac7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1642597660567-149d77b4d200?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODJ8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1669723008642-b00fa9d10b76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTh8fHdvcmtzcGFjZSUyMHNldHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1498409570040-05bf6d3dd5b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTMxfHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1628269989095-ef8569497706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTUwfHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1662018107938-0774bf96ac57?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY3fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1662018111612-e9ad7ee71562?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTcyfHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1648912795679-a4d06075c860?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc4fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1662019293071-bff94b65d33e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc3fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1600897330900-6c82b03459e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTkyfHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1608459266648-6f317872e914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjA3fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1653007717271-49db790effeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEwfHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1616440537338-1d04df3987f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjIyfHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1642181839728-26227a5c5905?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjI3fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1642181839728-26227a5c5905?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjI3fHx3b3Jrc3BhY2UlMjBzZXR1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
  ];

  @override
  void initState() {
    timer = Timer.periodic((const Duration(seconds: 10)), (value) {
      setState(() {
        index == imageList.length - 1 ? index = 0 : index++;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1500),
              // reverseDuration: const Duration(milliseconds: 500),
              child: Image.network(imageList[index],
                  key: Key(index.toString()),
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover)),
        ));
  }
}
