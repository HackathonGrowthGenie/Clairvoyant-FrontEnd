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

// class HistoricalReturnsLoadingState extends ClientSelectionState{}
//
// class HistoricalReturnsLoadedState extends ClientSelectionState{
//   final List<HistoricalReturnsModel> customer;
//   HistoricalReturnsLoadedState(this.customer);
// }
// class HistoricalReturnsErrorState extends ClientSelectionState{
//   final String error;
//   HistoricalReturnsErrorState(this.error);
// }
//
// class TaxAssessmentLoadingState extends ClientSelectionState{}
// class TaxAssessmentLoadedState extends ClientSelectionState{
//   final List<TaxAssesmentModel> customer;
//   TaxAssessmentLoadedState(this.customer);
// }
// class TaxAssessmentErrorState extends ClientSelectionState{
//   final String error;
//   TaxAssessmentErrorState(this.error);
// }
//
// class AvailableBalanceLoadingState extends ClientSelectionState{}
// class AvailableBalanceLoadedState extends ClientSelectionState{
//   final List<AvailableBalanceModel> customer;
//   AvailableBalanceLoadedState(this.customer);
// }
// class AvailableBalanceErrorState extends ClientSelectionState{
//   final String error;
//   AvailableBalanceErrorState(this.error);
// }
//
// class ROILoadingState extends ClientSelectionState{}
// class ROILoadedState extends ClientSelectionState{
//   final List<ROIModel> customer;
//   ROILoadedState(this.customer);
// }
// class ROIErrorState extends ClientSelectionState{
//   final String error;
//   ROIErrorState(this.error);
// }

