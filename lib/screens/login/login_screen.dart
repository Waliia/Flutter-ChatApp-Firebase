import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_demo/screens/login/login_form.dart';
import 'package:flutter_firebase_demo/widgets/check_connectivity.dart';

import '../../bloc/login/login_bloc.dart';
import '../../bloc/login/login_state.dart';
import '../../widgets/dialog.dart';
import '../home/home_page.dart';

class LoginScreen extends StatelessWidget {
  static const String PAGE_NAME = 'loginpage';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: CheckConnectivity(child: ScaffoldPage()));
  }
}

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const LoginForm(),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return const SizedBox();
            } else if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginLoadedState) {
              //WidgetBinding binds the widget tree to the Flutter engine.
              // SchedulerBinding is the scheduler for running immediate tasks such as:
              //transient callbacks which are triggered by the system's Window
              SchedulerBinding.instance.addPostFrameCallback((Duration dur) {
                Navigator.pushReplacementNamed(context, HomeScreen.PAGE_NAME,
                    arguments: null);
              });
              return const SizedBox();
            } else if (state is LoginErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((Duration dur) {
                showDialog(
                    context: context,
                    builder: (context) => CustomDialog(masg: state.errorMsg));
              });
              return const SizedBox();
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    ));
  }
}
