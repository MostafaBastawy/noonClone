import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/models/category_model.dart';
import 'package:noon_clone/models/product_model.dart';
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
      getUserData();
      emit(AppUserLoginSuccessState());
    }).catchError((error) {
      emit(AppUserLoginErrorState(error.toString()));
    });
  }

  void userSignOut() {
    FirebaseAuth.instance.signOut().then((value) {
      emit(AppUserSignOutSuccessState());
      Future.delayed(const Duration(seconds: 1)).then((value) {
        currentIndex = 0;
        CacheHelper.removeData(key: 'uid');
      });
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

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userDataModel.toMap())
        .then((value) {
      emit(AppCreateUserInDatabaseSuccessState());
    }).catchError((error) {
      emit(AppCreateUserInDatabaseErrorState(error.toString()));
    });
  }

  UserDataModel? userDataModel;
  void getUserData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userDataModel = UserDataModel.fromJson(value.data()!);
      emit(AppGetUserDataSuccessState());
    }).catchError((error) {
      emit(AppGetUserDataErrorState(error.toString()));
    });
  }

  CategoryDataModel? categoryDataModel;
  List<CategoryDataModel> categories = [];
  void getCategoryData() {
    categories = [];
    FirebaseFirestore.instance.collection('categories').get().then((value) {
      value.docs.forEach((element) {
        categories.add(CategoryDataModel.fromJson(element.data()));
      });
      emit(AppGetCategoryDataSuccessState());
    }).catchError((error) {
      emit(AppGetCategoryDataErrorState(error.toString()));
    });
  }

  ProductDataModel? productDataModel;
  List<ProductDataModel> categoryBaby = [];
  List<ProductDataModel> categoryBeauty = [];
  List<ProductDataModel> categoryElectronics = [];
  List<ProductDataModel> categoryGrocery = [];
  List<ProductDataModel> categoryHomeKitchen = [];
  List<ProductDataModel> categoryLaptops = [];
  List<ProductDataModel> categoryMenFashion = [];
  List<ProductDataModel> categoryMobiles = [];
  List<ProductDataModel> categoryNewArrivals = [];
  List<ProductDataModel> categoryTVs = [];
  List<ProductDataModel> categoryWomenFashion = [];
  List<ProductDataModel> categoryAppliances = [];

  void getProducts() {
    categoryBaby = [];
    categoryBeauty = [];
    categoryElectronics = [];
    categoryGrocery = [];
    categoryHomeKitchen = [];
    categoryLaptops = [];
    categoryMenFashion = [];
    categoryMobiles = [];
    categoryNewArrivals = [];
    categoryTVs = [];
    categoryWomenFashion = [];
    categoryAppliances = [];
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Baby")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryBaby.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Beauty")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryBeauty.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Electronics")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryElectronics.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Grocery")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryGrocery.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Home & Kitchen")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryHomeKitchen.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Laptops")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryLaptops.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Men Fashion")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryMenFashion.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Mobiles")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryMobiles.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "New Arrivals")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryNewArrivals.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "TVs")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryTVs.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Women Fashion")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryWomenFashion.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: "Appliances")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryAppliances.add(ProductDataModel.fromJson(element.data()));
        emit(AppGetProductsDataSuccessState());
      });
    }).catchError((error) {
      emit(AppGetProductsDataErrorState(error));
    });
  }
}
