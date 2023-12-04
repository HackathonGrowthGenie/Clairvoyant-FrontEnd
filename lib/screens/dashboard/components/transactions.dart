import 'package:clairvoyant/data/models/recent_transactions_model.dart';
import 'package:clairvoyant/screens/dashboard/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/transaction_cubit/transaction_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Transactions",
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          BlocBuilder<TransactionCubit, TransactionState>(
            builder: (context, state) {
              if(state is TransactionLoadedState){
                var customer = state.customer;
                return SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: defaultPadding,
                    // minWidth: 600,
                    columns: [
                      DataColumn(
                        label: Text("Transaction"),
                      ),
                      DataColumn(
                        label: Text("Date and Time"),
                      ),
                      DataColumn(
                        label: Text("Amount"),
                      ),
                    ],
                    rows: List.generate(
                      state.customer.length,
                          (index) => recentDataRow(customer, index),
                    ),
                  ),
                );
              }
              else{
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

DataRow recentDataRow(List<RecentTransactionsModel> recentTransactions, int index ) {
  DateTime date = recentTransactions[index].transactionDate;
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(recentTransactions[index].transactionType.toString()),
            ),
          ],
        ),
      ),
      DataCell(Text('${date.day.toString()} ${date.month.toString()} ${date.year.toString()} - ${date.hour}:${date.hour}')),
      DataCell(Text('₹ ${recentTransactions[index].amount.toString()}')),
    ],
  );
}
