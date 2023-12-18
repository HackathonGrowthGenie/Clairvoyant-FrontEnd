import 'package:clairvoyant/data/models/detailed_inv_model.dart';

abstract class DetailedInvState{}

class DetailedInvLoadingState extends DetailedInvState{}

class DetailedInvLoadedState extends DetailedInvState{
  final List<DetailedInvModel> customer;
  DetailedInvLoadedState(this.customer);
}

class DetailedInvErrorState extends DetailedInvState{
  final String error;
  DetailedInvErrorState(this.error);
}