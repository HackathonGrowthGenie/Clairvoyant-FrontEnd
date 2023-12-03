import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/popularInvestment_model.dart';
import '../../../data/repository/PostRepository.dart';

class PopularInvCubit extends Cubit<PopularInvestState>{
  PopularInvCubit() : super( PopularInvLoadingState() ){
    fetchPost();
  }

  PopularInvestment investorRepository = PopularInvestment();

  void fetchPost() async {
    try{
      List<PopularInvestmentModel> toppopularInvestment = await investorRepository.fetchPost();
      emit(PopularInvLoadedState(toppopularInvestment));
    }
    on DioException catch(ex){
      emit(PopularInvErrorState(ex.message.toString()));
    }
  }
}