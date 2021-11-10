import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/models/cart_model.dart';
import 'package:noon_clone/models/category_model.dart';
import 'package:noon_clone/models/favorites_model.dart';
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
    //getUserData();
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
    emit(AppUserRegisterLoadingState());
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
    emit(AppUserLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      getUserData();
      getFavorites();
      getCartItems();

      emit(AppUserLoginSuccessState());
    }).catchError((error) {
      emit(AppUserLoginErrorState(error.toString()));
    });
  }

  void userSignOut() {
    emit(AppUserSignOutLoadingState());
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
    int? cartTotal,
  }) {
    UserDataModel userDataModel = UserDataModel(
      firstName,
      fullName,
      email,
      phone,
      address,
      uid = FirebaseAuth.instance.currentUser!.uid,
      cartTotal = 0,
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
    emit(AppGetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      userDataModel = UserDataModel.fromJson(event.data()!);
      emit(AppGetUserDataSuccessState());
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

  void addToFavorites({
    required String description,
    required String imageUrl,
    required String name,
    required int price,
    String? userUid,
    String? pUid,
    required String productUid,
  }) {
    FavoriteDataModel favoriteDataModel = FavoriteDataModel(
      description,
      imageUrl,
      name,
      price,
      userUid = FirebaseAuth.instance.currentUser!.uid,
      pUid,
    );

    FirebaseFirestore.instance
        .collection('favorites')
        .doc('${FirebaseAuth.instance.currentUser!.email}$productUid')
        .set(favoriteDataModel.toMap())
        .then((value) {
      emit(AppAddToFavoritesSuccessState());
    }).catchError((error) {
      emit(AppAddToFavoritesErrorState(error.toString()));
    });
  }

  List<FavoriteDataModel> favorites = [];
  void getFavorites() {
    emit(AppGetFavoritesDataLoadingState());
    FirebaseFirestore.instance
        .collection('favorites')
        .where("userUid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      favorites = [];
      event.docs.forEach((element) {
        favorites.add(FavoriteDataModel.fromJson(element.data()));
      });
      emit(AppGetFavoritesDataSuccessState());
    });
  }

  void removeFromFavorite({
    required String userEmail,
    required String pUid,
  }) {
    FirebaseFirestore.instance
        .collection('favorites')
        .doc('$userEmail$pUid')
        .delete()
        .then((value) {
      emit(AppRemoveFromFavoritesSuccessState());
    }).catchError((error) {
      emit(AppRemoveFromFavoritesErrorState(error.toString()));
    });
  }

  void addToCart({
    required String description,
    required String imageUrl,
    required String name,
    required int price,
    String? pUid,
    required String productUid,
    String? userUid,
    int? counter,
  }) {
    CartDataModel cartDataModel = CartDataModel(
      description,
      imageUrl,
      name,
      price,
      userUid = FirebaseAuth.instance.currentUser!.uid,
      pUid,
      counter = 1,
    );

    FirebaseFirestore.instance
        .collection('cart')
        .doc('${FirebaseAuth.instance.currentUser!.email}$productUid')
        .set(cartDataModel.toMap())
        .then((value) {
      emit(AppAddToCartSuccessState());
    }).catchError((error) {
      emit(AppAddToCartErrorState(error.toString()));
    });
  }

  List<CartDataModel> cart = [];
  void getCartItems() {
    FirebaseFirestore.instance
        .collection('cart')
        .where("userUid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      cart = [];
      event.docs.forEach((element) {
        cart.add(CartDataModel.fromJson(element.data()));
      });
      emit(AppGetCartDataSuccessState());
    });
  }

  void removeFromCart({
    required String userEmail,
    required String pUid,
  }) {
    FirebaseFirestore.instance
        .collection('cart')
        .doc('$userEmail$pUid')
        .delete()
        .then((value) {
      emit(AppRemoveFromCartSuccessState());
    }).catchError((error) {
      emit(AppRemoveFromCartErrorState(error.toString()));
    });
  }

  void updateUserCartTotal({
    required int total,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'cartTotal': total}).then((value) {
      emit(AppUpdateUserCartTotalSuccessState());
    }).catchError((error) {
      emit(AppUpdateUserCartTotalErrorState(error.toString()));
    });
  }

  void updateUserCartCounter({
    required String productUid,
    required int counter,
  }) {
    FirebaseFirestore.instance
        .collection('cart')
        .doc('${FirebaseAuth.instance.currentUser!.email}$productUid')
        .update({'counter': counter}).then((value) {
      emit(AppUpdateUserCartCounterSuccessState());
    }).catchError((error) {
      emit(AppUpdateUserCartCounterErrorState(error.toString()));
    });
  }

  List<ProductDataModel> categoryProducts = [];
  void getCategoryProducts({required String category}) {
    categoryProducts = [];
    FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: category)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categoryProducts.add(ProductDataModel.fromJson(element.data()));
        print(categoryProducts.length);
      });
      emit(AppGetCategoryProductsSuccessState());
    }).catchError((error) {
      emit(AppGetCategoryProductsErrorState(error.toString()));
    });
  }
}
