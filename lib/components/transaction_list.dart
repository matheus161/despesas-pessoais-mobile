import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'trasaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transations;
  final void Function(String) onRemove;

  const TransactionList(this.transations, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transations.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Nehuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // Espaço entre o container e a imagem
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/loading.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transations.length,
            itemBuilder: (ctx, index) {
              final item = transations[index];
              return TransactionItem(
                item: item,
                onRemove: onRemove,
              );
            },
          );
  }
}
