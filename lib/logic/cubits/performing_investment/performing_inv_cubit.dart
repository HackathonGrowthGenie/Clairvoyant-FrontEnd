import 'package:clairvoyant/logic/cubits/performing_investment/performing_inv_state.dart';
import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/popularInvestment_model.dart';
import '../../../data/models/topPerformingInvestment_model.dart';
import '../../../data/repository/PostRepository.dart';

class PerformingInvCubit extends Cubit<PerfermingInvestState>{
  PerformingInvCubit() : super( PerformingInvLoadingState() ){
    fetchPost();
  }

  TopPerformingInvest investorRepository = TopPerformingInvest();

  void fetchPost() async {
    try{
      List<TopPerformingInvestment> performingInvestment = await investorRepository.fetchPost();
      emit(PerformingInvLoadedState(performingInvestment));
    }
    on DioException catch(ex){
      emit(PerformingInvErrorState(ex.message.toString()));
    }
  }
}