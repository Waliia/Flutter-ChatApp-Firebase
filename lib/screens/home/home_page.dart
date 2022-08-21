import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_demo/bloc/homebloc/home_bloc.dart';
import 'package:flutter_firebase_demo/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

import '../../authentication/authentication.dart';
import '../../model/user_model.dart';

class HomeScreen extends StatelessWidget {
  static const String PAGE_NAME = 'homepage';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).add(FetchUserEvent());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('C H A T'),
          actions: [
            IconButton(
                onPressed: () async {
                  await signout();
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.PAGE_NAME);
                },
                icon: const Icon(Icons.login))
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeLoadedState) {
              return HomeScreenBody(users: state.users);
            } else if (state is HomeErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              });
              return const Center(
                child: Text('No Users'),
              );
            } else if (state is EmptyState) {
              return const Center(
                child: Text('No Users======='),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}

class HomeScreenBody extends StatelessWidget {
  final List<UserModel> users;
  FirebaseAuth auth = FirebaseAuth.instance;
  HomeScreenBody({required this.users, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        UserModel model = users[index];
        if (model.uid != auth.currentUser!.uid) {
          return userView(model, context);
        } else {
          return SizedBox();
        }
      },
      itemCount: users.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey.withOpacity(0.5),
          height: 0.3,
          endIndent: 20,
          indent: 20,
        );
      },
    );
  }

  Widget userView(UserModel model, BuildContext context) {
    return ListTile(
      onTap: () {
        //Navigator.pushNamed(context, ChatPage.PAGE_NAME,arguments: model);
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        model.name,
        style: TextStyle(color: Colors.white.withOpacity(0.8)),
      ),
      subtitle: Text(
        model.email,
        style: TextStyle(color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}
