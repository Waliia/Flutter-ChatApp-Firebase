import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/firebase.dart';
import '../../model/chat_model.dart';
import 'chatview_event.dart';
import 'chatview_state.dart';

class ChatViewBloc extends Bloc<ChatEvent, ChatViewState> {
  ChatViewBloc() : super(ChatInitialState()) {
    on<ChatEvent>((event, emit) async {
      if (event is SendMsgEvent) {
        try {
          List<ChatModel> list = await chatClosure(event.model);
          emit(ChatLoadedState(list));
        } on FirebaseException catch (e) {
          emit(ChatErrorState(e.message!));
        } catch (e) {
          emit(ChatErrorState(e.toString()));
        }
      } else if (event is LoadChatEvent) {
        emit.call(ChatLoadingState());
        try {
          List<ChatModel> chats = await fetchChat(event.model);
          emit(ChatLoadedState(chats));
        } on FirebaseException catch (e) {
          emit.call(ChatErrorState(e.message!));
        } catch (e) {
          emit.call(ChatErrorState(e.toString()));
        }
      }
    });
  }
}
