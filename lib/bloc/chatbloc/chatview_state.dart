import 'package:flutter/material.dart';

import '../../model/chat_model.dart';

@immutable
abstract class ChatViewState {
  const ChatViewState();
}

class ChatInitialState extends ChatViewState {}

class ChatLoadingState extends ChatViewState {}

class ChatLoadedState extends ChatViewState {
  final List<ChatModel> list;
  const ChatLoadedState(this.list);
}

class ChatErrorState extends ChatViewState {
  String errorMsg;
  ChatErrorState(this.errorMsg);
}
