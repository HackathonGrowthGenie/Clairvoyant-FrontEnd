import 'package:clairvoyant/data/models/recent_transactions_model.dart';

abstract class TransactionState{}

class TransactionLoadingState extends TransactionState{}

class TransactionLoadedState extends TransactionState{
  final List<RecentTransactionsModel> customer;
  TransactionLoadedState(this.customer);
}

class TransactionErrorState extends TransactionState{
  final String error;
  TransactionErrorState(this.error);
}