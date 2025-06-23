class SettingStates {}

final class SettingInitial extends SettingStates {}

final class SignOutLoadingState extends SettingStates {}

final class SignOutSuccessState extends SettingStates {}

final class SignOutErrorState extends SettingStates {
  final String message;
  SignOutErrorState(this.message);
}
