import '../../../domain/entities/user_entity.dart';

class SignInSocialState {}

final class SignInSocialInitial extends SignInSocialState {}

final class SignInSocialLoadingState extends SignInSocialState {}

final class SignInSocialSuccessState extends SignInSocialState {
  final UserEntity userEntity;
  SignInSocialSuccessState({required this.userEntity});
}

final class SignInSocialErrorState extends SignInSocialState {
  final String errorMessage;
  SignInSocialErrorState({required this.errorMessage});
}
