class SignInState {}

final class AuthInitial extends SignInState {}


final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}

