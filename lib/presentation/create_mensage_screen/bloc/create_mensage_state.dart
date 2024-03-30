// ignore_for_file: must_be_immutable

part of 'create_mensage_bloc.dart';

/// Represents the state of CreateMensage in the application.
class CreateMensageState extends Equatable {
  CreateMensageState({
    this.inputBoxController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.createMensageModelObj,
  });

  TextEditingController? inputBoxController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  CreateMensageModel? createMensageModelObj;

  @override
  List<Object?> get props => [
        inputBoxController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        createMensageModelObj,
      ];

  CreateMensageState copyWith({
    TextEditingController? inputBoxController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    CreateMensageModel? createMensageModelObj,
  }) {
    return CreateMensageState(
      inputBoxController: inputBoxController ?? this.inputBoxController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      selectedDropDownValue3:
          selectedDropDownValue3 ?? this.selectedDropDownValue3,
      selectedDropDownValue4:
          selectedDropDownValue4 ?? this.selectedDropDownValue4,
      createMensageModelObj:
          createMensageModelObj ?? this.createMensageModelObj,
    );
  }
}
