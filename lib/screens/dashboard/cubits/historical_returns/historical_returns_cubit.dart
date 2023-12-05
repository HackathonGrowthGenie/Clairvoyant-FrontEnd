import 'package:clairvoyant/data/models/historical_returns_model.dart';
import 'package:clairvoyant/data/repository/PostRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'historical_returns_state.dart';

class HistoricalReturnsCubit extends Cubit<HistoricalReturnState>{
  HistoricalReturnsCubit() : super( HistoricalReturnLoadingState() ){
    fetchPost();
  }
  HistoricalReturn investorRepository = HistoricalReturn();

  void fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientId = prefs.getString('clientId');
    try{
      List<HistoricalReturnsModel> transaction = await investorRepository.fetchPost(clientId!);
      emit(HistoricalReturnLoadedState(transaction));
    }
    on DioException catch(ex){
      emit(HistoricalReturnErrorState(ex.message.toString()));
    }
  }
}