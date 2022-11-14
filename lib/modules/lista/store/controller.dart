import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../models/item_model.dart';
part 'controller.g.dart';

var uuid = const Uuid();

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  ObservableList<Item> list = [
    Item(name: 'Bruna da Silva', id: uuid.v4()),
    Item(name: 'Roberto Ribeiro', id: uuid.v4())
  ].asObservable();

  @observable
  String newName = '';

  @action
  addItem(Item item) {
    item.id = uuid.v1();
    list.add(item);
  }

  @action
  deleteItem(Item item) {
    list.removeWhere((items) => items.id == item.id);
  }

  @action
  changeItem(String value) => newName = value;

  dispose(){}
}
