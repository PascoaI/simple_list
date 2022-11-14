// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$listAtom = Atom(name: 'ControllerBase.list', context: context);

  @override
  ObservableList<Item> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Item> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$newNameAtom =
      Atom(name: 'ControllerBase.newName', context: context);

  @override
  String get newName {
    _$newNameAtom.reportRead();
    return super.newName;
  }

  @override
  set newName(String value) {
    _$newNameAtom.reportWrite(value, super.newName, () {
      super.newName = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic addItem(Item item) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItem(Item item) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.deleteItem');
    try {
      return super.deleteItem(item);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeItem(String value) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeItem');
    try {
      return super.changeItem(value);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
newName: ${newName}
    ''';
  }
}
