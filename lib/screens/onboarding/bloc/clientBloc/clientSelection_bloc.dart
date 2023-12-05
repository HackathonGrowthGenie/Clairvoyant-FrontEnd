import 'package:clairvoyant/data/models/availableBalance_model.dart';
import 'package:clairvoyant/data/models/historical_returns_model.dart';
import 'package:clairvoyant/data/models/recent_transactions_model.dart';
import 'package:clairvoyant/data/models/roi_model.dart';
import 'package:clairvoyant/data/models/tax_calculation_model.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_event.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/post_model.dart';
import '../../../../data/repository/PostRepository.dart';

class ClientSelectionBloc extends Bloc<ClientSelectionEvent, ClientSelectionState> {
  ClientSelectionBloc() : super(ClientInitialState()) {
    on<ClientTextChangedEvent>((event, emit) {
      if (event.clientIdValue.length >3) {
        emit(ClientIdValidState());
      } else {
        emit(ClientIdErrorState(
            "${event.clientIdValue} is not a 4 digit integer"));
      }
    });
    on<ClientSubmittedEvent>((event, emit) {
      fetchPost(event.clientId);
      // fetchHistoryPost(event.clientId);
      emit(ClientIdLoadingState());
    });
  }

  CustomerRepository postRepository = CustomerRepository();
    void fetchPost(String clintId) async {
      try{
        List<CustomerModel> post = await postRepository.fetchPost(clintId);
        emit(DataLoadedState(post));
      }
      on DioException catch(ex){
        emit(DataErrorState(ex.message.toString()));
      }
    }

  // HistoricalReturn historyRepository = HistoricalReturn();
  // void fetchHistoryPost(String clintId) async {
  //   try{
  //     List<HistoricalReturnsModel> post = await historyRepository.fetchPost(clintId);
  //     emit(HistoricalReturnsLoadedState(post));
  //   }
  //   on DioException catch(ex){
  //     emit(HistoricalReturnsErrorState(ex.message.toString()));
  //   }
  // }
  //
  // TaxAssesment taxAssesment = TaxAssesment();
  // void fetchTaxPost(String clintId) async {
  //   try{
  //     List<TaxAssesmentModel> post = await taxAssesment.fetchPost(clintId);
  //     emit(TaxAssessmentLoadedState(post));
  //   }
  //   on DioException catch(ex){
  //     emit(TaxAssessmentErrorState(ex.message.toString()));
  //   }
  // }
  //
  //
  //
  // AvailableBalance availableBalance = AvailableBalance();
  // void fetchAvailableBalancePost(String clintId) async {
  //   try{
  //     List<AvailableBalanceModel> post = await availableBalance.fetchPost(clintId);
  //     emit(AvailableBalanceLoadedState(post));
  //   }
  //   on DioException catch(ex){
  //     emit(AvailableBalanceErrorState(ex.message.toString()));
  //   }
  // }
  //
  // ROI roi = ROI();
  // void fetchRoiPost(String clintId) async {
  //   try{
  //     List<ROIModel> post = await roi.fetchPost(clintId);
  //     emit(ROILoadedState(post));
  //   }
  //   on DioException catch(ex){
  //     emit(ROIErrorState(ex.message.toString()));
  //   }
  // }

}
