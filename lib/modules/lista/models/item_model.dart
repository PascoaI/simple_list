import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class Item = _ItemBase with _$Item;

abstract class _ItemBase with Store {
  _ItemBase({required this.name,  required this.id});

  @observable
  String name;

  @observable
  String id;
}


