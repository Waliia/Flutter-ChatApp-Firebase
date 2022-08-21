import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_demo/screens/home/home_page.dart';
import 'package:flutter_firebase_demo/widgets/check_connectivity.dart';

import '../../bloc/register/register_bloc.dart';
import '../../widgets/dialog.dart';
import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const String PAGE_NAME = 'registerpage';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckConnectivity(
        child: Scaffold(
      body: Stack(
        children: [
          const SafeArea(child: RegisterForm()),
          BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
            if (state is RegisterInitial) {
              return const SizedBox();
            } else if (state is RegisterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RegisterLoadedState) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacementNamed(context, HomeScreen.PAGE_NAME);
              });
              return const SizedBox();
            } else if (state is RegisterErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(masg: state.message),
                );
              });
              return const SizedBox();
            } else {
              return const SizedBox();
            }
          })
        ],
      ),
    ));
  }
}
