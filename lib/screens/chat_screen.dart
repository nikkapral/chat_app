import 'package:chattapp/models/models.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
    builder: (context) => ChatScreen(
      messageData: data,
    ),
  );

  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

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
      body: Column(
        children: [
          Expanded(child: _DemoMessageList()),
          _ActionBar(),
        ],
      ),
    );
  } 
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Faker faker = Faker();

    return ListView(
      children: [
        _DateLabel(lable: 'Yesterday'),
        _ContactMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),
        _ContactMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),
        _UserMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),
        _UserMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),
        _ContactMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),
        _ContactMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),
        _ContactMessageTitle(message: faker.lorem.sentence(), messageDate: '12:02PM'),

      ]
    );
  }


}

class _DateLabel extends StatelessWidget {
  const _DateLabel({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              lable,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textLigth,
              )
            )
          )
        )
      )
    );
  }
}

class _ContactMessageTitle extends StatelessWidget {
  const _ContactMessageTitle({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
          ] 
        )
      )
    );
  }
}

class _UserMessageTitle extends StatelessWidget{
  const _UserMessageTitle({
    Key? key,
    required this.message,
    required this.messageDate,
    }) : super(key: key);

  final String message;
  final String messageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Text(
                  message,
                  style:const TextStyle(
                    color: AppColors.textLigth,
                  )
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )
              )
            )
          ]
        )
      )
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: const Radius.circular(30)),
        color: AppColors.secondary,
      ),
      child: SafeArea(
        bottom: true,
        top: true,
        minimum: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Icon(
                  CupertinoIcons.camera_fill,
                )
              )
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Your message...',
                    border: InputBorder.none,
                  )
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 10,
              ),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.send_rounded),
                onPressed: () {},)
            )
          ]
        )
      ),
    );
  }


}