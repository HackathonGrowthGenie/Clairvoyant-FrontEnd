import 'package:clairvoyant/logic/cubits/top_investor/top_investor_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/topInvestors_model.dart';
import '../../../data/repository/PostRepository.dart';

class TopInvestCubit extends Cubit<TopInvestorState>{
  TopInvestCubit() : super( PostLoadingState() ){
    fetchPost();
  }

  TopInvestorsRepository investorRepository = TopInvestorsRepository();

  void fetchPost() async {
    try{
      List<TopInvesters> investors = await investorRepository.fetchPost();
      emit(PostLoadedState(investors));
    }
    on DioException catch(ex){
      emit(PostErrorState(ex.message.toString()));
    }
  }
}