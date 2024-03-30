import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:gustavo_smalk_s_application65/presentation/login_register_screen/models/login_register_model.dart';
part 'login_register_event.dart';
part 'login_register_state.dart';

/// A bloc that manages the state of a LoginRegister according to the event that is dispatched to it.
class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc(LoginRegisterState initialState) : super(initialState) {
    on<LoginRegisterInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginRegisterState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _onInitialize(
    LoginRegisterInitialEvent event,
    Emitter<LoginRegisterState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isShowPassword: true,
    ));
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.homeContainerScreen,
      );
    });
  }
}
