import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_list/modules/lista/components/alert_dialog_edit.dart';
import 'package:simple_list/modules/lista/models/item_model.dart';
import 'package:simple_list/modules/lista/store/controller.dart';
import 'package:flutter/material.dart';


class ItemWidget extends StatelessWidget {
  final Item item;
  final Controller controller;

   ItemWidget({
   Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(
                      '${item.name}',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    )
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(2.0))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: IconButton(
                                icon:  const Icon(Icons.edit, color: Colors.limeAccent,),
                                onPressed: () => editDialog(context, controller, item)

                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(2.0))),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: IconButton(
                                icon: const Icon(Icons.delete_forever),
                                onPressed: () => controller.deleteItem(item),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }


}
