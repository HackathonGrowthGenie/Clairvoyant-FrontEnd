import 'package:clairvoyant/data/models/availableBalance_model.dart';
import 'package:clairvoyant/screens/dashboard/cubits/available_balance_cubit/availablebal_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repository/PostRepository.dart';

class AvailableBalCubit extends Cubit<AvailableBalState>{
  AvailableBalCubit() : super( AvailableBalLoadingState() ){
    fetchPost();
  }
  AvailableBalance investorRepository = AvailableBalance();

  void fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientId = prefs.getString('clientId');
    try{
      List<AvailableBalanceModel> transaction = await investorRepository.fetchPost(clientId!);
      emit(AvailableBalLoadedState(transaction));
    }
    on DioException catch(ex){
      emit(AvailableBalErrorState(ex.message.toString()));
    }
  }
}