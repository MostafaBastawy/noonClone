import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/bloc_observer.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/modules/login_screen.dart';
import 'package:noon_clone/modules/main_page_layout.dart';
import 'package:noon_clone/shared/shared_preference.dart';
import 'package:noon_clone/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp();
  String uid = CacheHelper.getData(key: 'uid') ?? '';
  Widget startScreen;
  uid.isNotEmpty ? startScreen = HomeLayout() : startScreen = LoginScreen();
  runApp(MyApp(
    startScreen: startScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startScreen;

  MyApp({Key? key, this.startScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightMode,
        home: startScreen,
      ),
    );
  }
}
