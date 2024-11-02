import 'package:chat_app/constants.dart';

class Message{
  final String message;
final String id;
  Message(  {required this.message,required this.id});
  factory Message.fromJson(json){
    return Message(message: json[kMessage], id:json['id']??'');
  }
}