import 'package:clairvoyant/screens/onboarding/bloc/loginBloc/login_state.dart';
import 'package:clairvoyant/screens/onboarding/bloc/loginBloc/loign_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginInitialState()){
    on<LoginUserChangedEvent>((event, emit){
        if(event.usernameValue.length<8){
          emit(LoginUserErrorState("Please type min 8 characters username"));
        }else{
          emit(LoginValidState());
        }
    });
    on<LoginPassChangedEvent>((event, emit){
      if(event.passwordValue.length<6){
        emit(LoginPasswordErrorState("Please type min 6 characters password"));
      }else{
        emit(LoginValidState());
      }
    });
    on<LoginSubmittedEvent>((event, emit){
        LoginLoadingState();
    });
  }
}