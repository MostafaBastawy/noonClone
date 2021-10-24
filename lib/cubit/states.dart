abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppUserLoginSuccessState extends AppStates {}

class AppUserLoginErrorState extends AppStates {
  final String error;

  AppUserLoginErrorState(this.error);
}

class AppUserRegisterSuccessState extends AppStates {}

class AppUserRegisterErrorState extends AppStates {
  final String error;

  AppUserRegisterErrorState(this.error);
}

class AppCreateUserInDatabaseSuccessState extends AppStates {}

class AppCreateUserInDatabaseErrorState extends AppStates {
  final String error;

  AppCreateUserInDatabaseErrorState(this.error);
}

class AppGetUserDataSuccessState extends AppStates {}

class AppGetUserDataErrorState extends AppStates {
  final String error;

  AppGetUserDataErrorState(this.error);
}

class AppUserSignOutSuccessState extends AppStates {}

class AppUserSignOutErrorState extends AppStates {
  final String error;

  AppUserSignOutErrorState(this.error);
}

class AppGetCategoryDataSuccessState extends AppStates {}

class AppGetCategoryDataErrorState extends AppStates {
  final String error;

  AppGetCategoryDataErrorState(this.error);
}

class AppGetProductsDataSuccessState extends AppStates {}

class AppGetProductsDataErrorState extends AppStates {
  final String error;

  AppGetProductsDataErrorState(this.error);
}
