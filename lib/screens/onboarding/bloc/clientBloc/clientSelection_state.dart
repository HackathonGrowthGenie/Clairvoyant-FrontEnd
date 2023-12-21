import 'package:clairvoyant/data/models/availableBalance_model.dart';
import 'package:clairvoyant/data/models/historical_returns_model.dart';
import 'package:clairvoyant/data/models/recent_transactions_model.dart';
import 'package:clairvoyant/data/models/roi_model.dart';
import 'package:clairvoyant/data/models/tax_calculation_model.dart';

import '../../../../data/models/post_model.dart';

abstract class ClientSelectionState{}

class ClientInitialState extends ClientSelectionState{}

class ClientIdValidState extends ClientSelectionState{}

class ClientIdErrorState extends ClientSelectionState{
  final String errorMessage;
  ClientIdErrorState(this.errorMessage);
}

class ClientIdLoadingState extends ClientSelectionState{}


class DataLoadedState extends ClientSelectionState{
  final List<CustomerModel> customer;
  DataLoadedState(this.customer);
}

class DataErrorState extends ClientSelectionState{
  final String error;
  DataErrorState(this.error);
}

class DataUnAuthenticated extends ClientSelectionState{}

