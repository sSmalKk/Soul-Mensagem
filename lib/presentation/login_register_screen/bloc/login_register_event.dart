// ignore_for_file: must_be_immutable

part of 'login_register_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginRegister widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginRegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the LoginRegister widget is first created.
class LoginRegisterInitialEvent extends LoginRegisterEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginRegisterEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
