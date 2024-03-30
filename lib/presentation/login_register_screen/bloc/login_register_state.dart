// ignore_for_file: must_be_immutable

part of 'login_register_bloc.dart';

/// Represents the state of LoginRegister in the application.
class LoginRegisterState extends Equatable {
  LoginRegisterState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.loginRegisterModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  LoginRegisterModel? loginRegisterModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        loginRegisterModelObj,
      ];

  LoginRegisterState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginRegisterModel? loginRegisterModelObj,
  }) {
    return LoginRegisterState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginRegisterModelObj:
          loginRegisterModelObj ?? this.loginRegisterModelObj,
    );
  }
}
