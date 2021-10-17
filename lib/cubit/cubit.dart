import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/modules/cart_screen.dart';
import 'package:noon_clone/modules/categories_screen.dart';
import 'package:noon_clone/modules/favorites_screen.dart';
import 'package:noon_clone/modules/home_screen.dart';
import 'package:noon_clone/modules/profile_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];
}
