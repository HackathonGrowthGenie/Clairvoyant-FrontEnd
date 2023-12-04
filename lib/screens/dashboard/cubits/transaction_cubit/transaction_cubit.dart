import 'package:clairvoyant/data/models/recent_transactions_model.dart';
import 'package:clairvoyant/screens/dashboard/cubits/transaction_cubit/transaction_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repository/PostRepository.dart';

class TransactionCubit extends Cubit<TransactionState>{
  TransactionCubit() : super( TransactionLoadingState() ){
    fetchPost();
  }
  RecentTransaction investorRepository = RecentTransaction();

  void fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientId = prefs.getString('clientId');
    try{
      List<RecentTransactionsModel> transaction = await investorRepository.fetchPost(clientId!);
      emit(TransactionLoadedState(transaction));
    }
    on DioException catch(ex){
      emit(TransactionErrorState(ex.message.toString()));
    }
  }
}