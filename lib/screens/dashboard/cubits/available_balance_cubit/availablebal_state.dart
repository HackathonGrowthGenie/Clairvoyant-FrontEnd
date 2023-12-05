import 'package:clairvoyant/data/models/availableBalance_model.dart';

abstract class AvailableBalState{}

class AvailableBalLoadingState extends AvailableBalState{}

class AvailableBalLoadedState extends AvailableBalState{
  final List<AvailableBalanceModel> customer;
  AvailableBalLoadedState(this.customer);
}

class AvailableBalErrorState extends AvailableBalState{
  final String error;
  AvailableBalErrorState(this.error);
}