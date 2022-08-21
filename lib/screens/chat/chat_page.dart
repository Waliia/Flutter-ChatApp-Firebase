import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/chatbloc/chatview_bloc.dart';
import '../../bloc/chatbloc/chatview_event.dart';
import '../../bloc/chatbloc/chatview_state.dart';
import '../../controller/chatview_controller.dart';
import '../../model/chat_model.dart';
import '../../model/user_model.dart';

class ChatPage extends StatelessWidget {
  static const String PAGE_NAME = 'chatpage';
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    var bloc = Provider.of<ChatViewBloc>(context, listen: false);
    bloc.add(SendMsgEvent(ChatModel(
        msg: '',
        from: auth.currentUser!.uid,
        to: user.uid,
        time: DateTime.now())));
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name}'),
      ),
      body: Stack(
        children: [
          BlocBuilder<ChatViewBloc, ChatViewState>(
            builder: (context, state) {
              if (state is ChatInitialState) {
                return SizedBox();
              } else if (state is ChatLoadingState) {
                return SizedBox();
              } else if (state is ChatLoadedState) {
                if (state.list.isNotEmpty) {
                  return Chatview(list: state.list.reversed.toList());
                } else {
                  return SizedBox();
                }
              } else if (state is ChatErrorState) {
                return SizedBox();
              } else {
                return SizedBox();
              }
            },
          ),
          BuildBottomView(
            to: user.uid,
          ),
        ],
      ),
    );
  }
}

class BuildBottomView extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  String to;
  TextEditingController controller = TextEditingController();

  BuildBottomView({required this.to, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ChatViewBloc>(context, listen: false);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.withOpacity(0.2),
          ),
          child: Row(
            children: [
              Expanded(
                  child: btnIconWidget(
                icon: Icons.photo,
                color: Colors.amber[900],
                onCLick: () {},
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: btnIconWidget(
                icon: Icons.emoji_emotions,
                color: Colors.amber[900],
                onCLick: () {},
              )),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 220,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: btnIconWidget(
                  icon: Icons.send,
                  color: Colors.blue,
                  onCLick: () {
                    sendMsgclick(
                        context, to, auth.currentUser!.uid, controller, bloc);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton btnIconWidget(
      {IconData? icon, Color? color, VoidCallback? onCLick}) {
    return IconButton(
      onPressed: onCLick,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}

class Chatview extends StatelessWidget {
  final List<ChatModel> list;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Chatview({required this.list, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var chatModel = list[index];
        String sender = chatModel.from;

        if (auth.currentUser!.uid == sender) {
          return senderView(chatModel);
        } else {
          return reciverView(chatModel);
        }
      },
      itemCount: list.length,
    );
  }

  Widget senderView(ChatModel model) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        child: Row(
          children: [
            Text(model.msg),
            const SizedBox(
              width: 10,
            ),
            // Text('${model.time}')
          ],
        ),
      ),
    );
  }

  Widget reciverView(ChatModel model) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 100,
        child: Row(
          children: [
            Text(model.msg),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
