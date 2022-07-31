import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleContoller = TextEditingController();
  final valueController = TextEditingController();

  late final void Function(String, double) onSubmit;

  //TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleContoller.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

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
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Título: ',
                ),
              ),
              TextField(
                controller: valueController,
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Valor: (R\$)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.purple),
                    onPressed: _submitForm,
                    child: const Text('Nova Transação'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
