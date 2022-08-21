import 'package:flutter/material.dart';

import '../../model/chat_model.dart';

@immutable
abstract class ChatEvent {
  const ChatEvent();
}

class SendMsgEvent extends ChatEvent {
  final ChatModel model;
  SendMsgEvent(this.model);
}

class LoadChatEvent extends ChatEvent {
  final ChatModel model;
  const LoadChatEvent(this.model);
}
