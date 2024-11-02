import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
 ChatBuble({
    super.key, required this.message,
  });
final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16*2, bottom: 16*2, right: 16*2),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: kPrimaryColor,
        ),
        child:  Text(
          message.message,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubleFromUser extends StatelessWidget {
 ChatBubleFromUser({
    super.key, required this.message,
  });
final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16*2, bottom: 16*2, right: 16*2),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color:Color(0xff006D84),
        ),
        child:  Text(
          message.message,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
