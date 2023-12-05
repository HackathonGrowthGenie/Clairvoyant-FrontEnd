import 'package:clairvoyant/data/models/tax_calculation_model.dart';
import 'package:clairvoyant/data/repository/PostRepository.dart';
import 'package:clairvoyant/screens/dashboard/cubits/tax_assessment/tax_assessment_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaxAssessmentCubit extends Cubit<TaxAssessmentState>{
  TaxAssessmentCubit() : super( TaxAssessmentLoadingState() ){
    fetchPost();
  }
  TaxAssesment taxAssesment = TaxAssesment();

  void fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientId = prefs.getString('clientId');
    try{
      List<TaxAssesmentModel> transaction = await taxAssesment.fetchPost(clientId!);
      emit(TaxAssessmentLoadedState(transaction));
    }
    on DioException catch(ex){
      emit(TaxAssessmentErrorState(ex.message.toString()));
    }
  }
}