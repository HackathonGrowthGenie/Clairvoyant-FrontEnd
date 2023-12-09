
import '../../../../data/models/topPerformingInvestment_model.dart';

abstract class PerfermingInvestState{}

class PerformingInvLoadingState extends PerfermingInvestState{}

class PerformingInvLoadedState extends PerfermingInvestState{
  final List<TopPerformingInvestment> customer;
  PerformingInvLoadedState(this.customer);
}

class PerformingInvErrorState extends PerfermingInvestState{
  final String error;
  PerformingInvErrorState(this.error);
}