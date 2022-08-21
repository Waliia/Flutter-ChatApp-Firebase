import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_demo/bloc/login/login_bloc.dart';
import 'package:flutter_firebase_demo/screens/home/home_page.dart';
import 'package:flutter_firebase_demo/screens/login/login_screen.dart';

import 'app_navigation/app_navigation.dart';
import 'bloc/chatbloc/chatview_bloc.dart';
import 'bloc/connectivity/connectivity_bloc.dart';
import 'bloc/homebloc/home_bloc.dart';
import 'bloc/register/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<ChatViewBloc>(
          create: (context) => ChatViewBloc(),
        )
      ],
      child: MaterialApp(
        onGenerateRoute: AppNavigation.buildPage,
        home:
            auth.currentUser != null ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
