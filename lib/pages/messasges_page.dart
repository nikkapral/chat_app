import 'package:chattapp/helpers.dart';
import 'package:chattapp/screens/chat_screen.dart';
import 'package:chattapp/theme.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:chattapp/widgets/widgets.dart';

import '../models/models.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    Key? key,
    // required this.messageData,
  }) : super(key: key);

  // final MessageData messageData; 

  // Widget _delegate(BuildContext context, int index) {
  //   final Faker faker = Faker();
  //   return 
  // }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(_delegate),
          ),
        ],
      )
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();

    return _MessageInfo(messageData: MessageData(
      contactName: faker.person.name(), 
      message: faker.lorem.sentence(), 
      messageDate: date, 
      dateMessage: Jiffy(date).fromNow(), 
      profilePicture: Helpers.randomPictureUrl())
    );
  }
}

class _MessageInfo extends StatelessWidget {
  const _MessageInfo({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.secondary,
              width: 0.2,
            )
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avatar.medium(url: messageData.profilePicture),
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      messageData.contactName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        letterSpacing: .5,
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold,
                      )
                      ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      messageData.message, 
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textFaded,
                      )
                      )),
                ]
              ))
          
            ]
          ),
        ),
      ),
    );
  }

}
