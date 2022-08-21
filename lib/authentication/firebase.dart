import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_demo/model/user_model.dart';

import '../model/chat_model.dart';

Future<List<UserModel>> fetchUser() async {
  List<UserModel> users = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var querySnapshot = await firestore.collection('users').get();
  var list = querySnapshot.docs;
  for (var doc in list) {
    Map<String, dynamic> map = doc.data();
    UserModel userModel = UserModel.fromJson(map);
    users.add(userModel);
  }
  return Future(() => users);
}

Future<List<ChatModel>> chatClosure(ChatModel model) async {
  await sendMsg(model);
  var list = await fetchChat(model);
  return Future(() => list);
}

Future sendMsg(ChatModel model) async {
  var groupChatId;
  if (model.from.hashCode <= model.to.hashCode) {
    groupChatId = '${model.from}-${model.to}';
  } else {
    groupChatId = '${model.to}-${model.from}';
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var refrence =
      firestore.collection('messages').doc(groupChatId).collection('msg').doc();
  await refrence.set(model.toJson());
}

Future<List<ChatModel>> fetchChat(ChatModel model) async {
  List<ChatModel> chats = [];
  var groupChatId;
  if (model.from.hashCode <= model.to.hashCode) {
    groupChatId = '${model.from}-${model.to}';
  } else {
    groupChatId = '${model.to}-${model.from}';
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var querySnapshot = await firestore
      .collection('messages')
      .doc(groupChatId)
      .collection('msg')
      .orderBy('time', descending: true)
      .get();
  var chatDocs = querySnapshot.docs;
  for (var chat in chatDocs) {
    ChatModel chatModel = ChatModel.fromJson(chat.data());
    print(chatModel);
    chats.add(chatModel);
  }
  return Future(() => chats);
}
