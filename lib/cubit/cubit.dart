import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/models/user_model.dart';
import 'package:noon_clone/modules/cart_screen.dart';
import 'package:noon_clone/modules/categories_screen.dart';
import 'package:noon_clone/modules/favorites_screen.dart';
import 'package:noon_clone/modules/home_screen.dart';
import 'package:noon_clone/modules/profile_screen.dart';
import 'package:noon_clone/shared/shared_preference.dart';

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
    ProfileScreen(),
    const CartScreen(),
  ];

  void userRegister({
    required String email,
    required String password,
    required String firstName,
    required String fullName,
    required String phone,
    required String address,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUserInDatabase(
        firstName: firstName,
        fullName: fullName,
        email: email,
        phone: phone,
        address: address,
      );
      emit(AppUserRegisterSuccessState());
    }).catchError((error) {
      emit(AppUserRegisterErrorState(error.toString()));
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(AppUserLoginSuccessState());
    }).catchError((error) {
      emit(AppUserLoginErrorState(error.toString()));
    });
  }

  void userSignOut() {
    FirebaseAuth.instance.signOut().then((value) {
      emit(AppUserSignOutSuccessState());
      CacheHelper.removeData(key: 'uid');
    }).catchError((error) {
      emit(AppUserSignOutErrorState(error.toString()));
    });
  }

  void createUserInDatabase({
    required String firstName,
    required String fullName,
    required String email,
    required String phone,
    required String address,
    String? uid,
  }) {
    UserDataModel userDataModel = UserDataModel(
      firstName,
      fullName,
      email,
      phone,
      address,
      uid = FirebaseAuth.instance.currentUser!.uid,
    );

    FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .set(userDataModel.toMap())
        .then((value) {
      emit(AppCreateUserInDatabaseSuccessState());
    }).catchError((error) {
      emit(AppCreateUserInDatabaseErrorState(error.toString()));
    });
  }

  UserDataModel? userDataModel;
  void getUserData() {
    FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userDataModel = UserDataModel.fromJson(value.value);
      emit(AppGetUserDataSuccessState());
    }).catchError((error) {
      emit(AppGetUserDataErrorState(error.toString()));
    });
  }
}
