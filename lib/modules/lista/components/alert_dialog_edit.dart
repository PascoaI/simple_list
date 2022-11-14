import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_list/modules/lista/store/controller.dart';
import 'package:simple_list/modules/lista/models/item_model.dart';

void editDialog(BuildContext context, Controller controller, Item item) {

  var alert = Observer(builder: (context) {
    String value = item.name;

    return AlertDialog(
      title: const Text("Editar nome"),
      content: Observer(builder: (context) {
        return Stack(
          children: [
            TextFormField(
              initialValue: value,
              autofocus: true,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
              ],
              onChanged: (v) {
                value = v;
              },
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Digite aqui'),
            ),
          ],
        );
      }),
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("Alterar"),
          onPressed: () {
            if (value != '') {
              item.name = value;
              controller.changeItem(item.name);
              Navigator.of(context).pop();

            } else if (item.name.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AlertDialog(
                        title: const Text('ERRO!'),
                        content: const Text('DIGITE ALGUM NOME!'),
                        actions: [
                          TextButton(
                              child: const Text("OK"),
                              onPressed: () =>
                                  Navigator.of(context).pop(false)),
                        ],
                      ),
                    );
                  }));
            }
          },
        )
      ],
    );
  });

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
