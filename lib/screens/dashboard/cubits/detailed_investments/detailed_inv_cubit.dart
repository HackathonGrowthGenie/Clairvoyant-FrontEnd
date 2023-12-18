import 'package:clairvoyant/data/models/detailed_inv_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repository/PostRepository.dart';
import 'detailed_inv_state.dart';

class DetailedInvCubit extends Cubit<DetailedInvState>{
  DetailedInvCubit() : super( DetailedInvLoadingState() ){
    fetchPost();
  }
  DetailedInv investorRepository = DetailedInv();

  DetailedInv postRepository = DetailedInv();
  void fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientId = prefs.getString('clientId');
    try{
      List<DetailedInvModel> post = await postRepository.fetchPost(clientId!);
      emit(DetailedInvLoadedState(post));
    }
    on DioException catch(ex){
      emit(DetailedInvErrorState(ex.message.toString()));
    }
  }
}