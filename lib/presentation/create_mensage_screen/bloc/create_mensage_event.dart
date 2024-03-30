// ignore_for_file: must_be_immutable

part of 'create_mensage_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CreateMensage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreateMensageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the CreateMensage widget is first created.
class CreateMensageInitialEvent extends CreateMensageEvent {
  @override
  List<Object?> get props => [];
}
