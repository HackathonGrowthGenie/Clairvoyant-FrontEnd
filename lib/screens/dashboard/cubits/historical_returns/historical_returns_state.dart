import 'package:clairvoyant/data/models/historical_returns_model.dart';

abstract class HistoricalReturnState{}

class HistoricalReturnLoadingState extends HistoricalReturnState{}

class HistoricalReturnLoadedState extends HistoricalReturnState{
  final List<HistoricalReturnsModel> customer;
  HistoricalReturnLoadedState(this.customer);
}

class HistoricalReturnErrorState extends HistoricalReturnState{
  final String error;
  HistoricalReturnErrorState(this.error);
}