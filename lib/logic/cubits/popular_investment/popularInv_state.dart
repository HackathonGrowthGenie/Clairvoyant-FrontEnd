import 'package:clairvoyant/data/models/post_model.dart';
import 'package:clairvoyant/data/models/topInvestors_model.dart';

import '../../../data/models/popularInvestment_model.dart';

abstract class PopularInvestState{}

class PopularInvLoadingState extends PopularInvestState{}

class PopularInvLoadedState extends PopularInvestState{
  final List<PopularInvestmentModel> customer;
  PopularInvLoadedState(this.customer);
}

class PopularInvErrorState extends PopularInvestState{
  final String error;
  PopularInvErrorState(this.error);
}