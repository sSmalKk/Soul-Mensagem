import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:gustavo_smalk_s_application65/presentation/create_mensage_screen/models/create_mensage_model.dart';
part 'create_mensage_event.dart';
part 'create_mensage_state.dart';

/// A bloc that manages the state of a CreateMensage according to the event that is dispatched to it.
class CreateMensageBloc extends Bloc<CreateMensageEvent, CreateMensageState> {
  CreateMensageBloc(CreateMensageState initialState) : super(initialState) {
    on<CreateMensageInitialEvent>(_onInitialize);
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList3() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList4() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    CreateMensageInitialEvent event,
    Emitter<CreateMensageState> emit,
  ) async {
    emit(state.copyWith(
      inputBoxController: TextEditingController(),
    ));
    emit(state.copyWith(
        createMensageModelObj: state.createMensageModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      dropdownItemList2: fillDropdownItemList2(),
      dropdownItemList3: fillDropdownItemList3(),
      dropdownItemList4: fillDropdownItemList4(),
    )));
  }
}
