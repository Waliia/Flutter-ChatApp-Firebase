import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/chatbloc/chatview_event.dart';
import '../model/chat_model.dart';

void sendMsgclick(BuildContext context, String to, String from,
    TextEditingController controller, var bloc) {
  ChatModel model =
      ChatModel(msg: controller.text, from: from, to: to, time: DateTime.now());
  controller.clear();
  bloc.add(SendMsgEvent(model));
}
