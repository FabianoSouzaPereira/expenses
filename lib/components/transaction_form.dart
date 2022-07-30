import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleContoller = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleContoller,
                decoration: const InputDecoration(
                  labelText: 'Título: ',
                ),
              ),
              TextField(
                controller: valueController,
                decoration: const InputDecoration(
                  labelText: 'Valor: (R\$)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.purple),
                    onPressed: () {
                      final title = titleContoller.text;
                      final value =
                          double.tryParse(valueController.text) ?? 0.0;
                      onSubmit(title, value);
                    },
                    child: const Text('Nova Transação'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
