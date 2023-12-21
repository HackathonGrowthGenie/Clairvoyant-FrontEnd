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
}
