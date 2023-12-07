import 'package:clairvoyant/data/models/roi_model.dart';
import 'package:clairvoyant/screens/dashboard/cubits/roi_cubit/roi_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repository/PostRepository.dart';

class ROICubit extends Cubit<ROIState>{
  ROICubit() : super( ROILoadingState() ){
    fetchPost();
  }
  ROI roiRepository = ROI();

  void fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientId = prefs.getString('clientId');
    try{
      List<ROIModel> transaction = await roiRepository.fetchPost(clientId!);
      emit(ROILoadedState(transaction));
    }
    on DioException catch(ex){
      emit(ROIErrorState(ex.message.toString()));
    }
  }
}