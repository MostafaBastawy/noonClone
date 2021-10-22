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
