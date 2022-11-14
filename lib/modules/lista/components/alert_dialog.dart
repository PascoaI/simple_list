import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_list/modules/lista/store/controller.dart';
import 'package:simple_list/modules/lista/models/item_model.dart';


void addDialog(BuildContext context, Controller controller) {
  String e = '';

  var alert = AlertDialog(
    title: const Text("Registrar nome"),
    content: Observer(builder: (_) {
      return Stack(
        children: [
          TextFormField(
            autofocus: true,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
            ],
            onChanged: (v) {
              e = v;
            },
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Digite o nome...'),
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
        child: Text("Salvar"),
        onPressed: () {
          if (e != '') {
            controller.addItem(
                Item(name: e, id: '')
            );
            Navigator.of(context).pop();
          }
          else if (e.isEmpty) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AlertDialog(
                      title: const Text('ERRO!'),
                      content: const Text(
                          'DIGITE ALGUM NOME!'),
                      actions: [
                        TextButton(
                            child: const Text("OK"),
                            onPressed: () =>
                                Navigator.of(context)
                                    .pop(false)),
                      ],
                    ),
                  );
                }));
          }
        },
      )
    ],
  );




  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
