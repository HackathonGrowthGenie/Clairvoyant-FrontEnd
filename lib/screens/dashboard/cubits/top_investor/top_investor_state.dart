import 'package:clairvoyant/data/models/post_model.dart';
import 'package:clairvoyant/data/models/topInvestors_model.dart';

abstract class TopInvestorState{}

class PostLoadingState extends TopInvestorState{}

class PostLoadedState extends TopInvestorState{
  final List<TopInvesters> customer;
  PostLoadedState(this.customer);
}

class PostErrorState extends TopInvestorState{
  final String error;
  PostErrorState(this.error);
}