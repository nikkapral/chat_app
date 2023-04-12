import 'dart:ffi';

import 'package:chattapp/pages/pages.dart';
import 'package:chattapp/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60, // Set this height
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(33),bottomRight: Radius.circular(33)),
            color: AppColors.secondary,
          )
        ),
        title: Text('Chat app'),
      ),
      drawer: NavBar(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          MessagesPage(),
          RequestsPage(),
        ]
      )
    );
  }


}