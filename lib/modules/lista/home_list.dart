import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simple_list/modules/lista/store/controller.dart';
import 'components/itemWidget.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Observer(builder: (_) {
      if (controller.list.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  final item = controller.list[index];
                  return ItemWidget(
                      controller: controller, item: item
                  );
                }),
          ),
        );
      } else {
        return Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text('Nenhum nome registrado!'));
      }
    });
  }
}
