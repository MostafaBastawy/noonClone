import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/bloc_observer.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/modules/main_page_layout.dart';
import 'package:noon_clone/shared/themes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightMode,
        home: const HomeLayout(),
      ),
    );
  }
}
