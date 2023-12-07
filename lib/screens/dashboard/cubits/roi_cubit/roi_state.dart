import 'package:clairvoyant/data/models/roi_model.dart';

abstract class ROIState{}

class ROILoadingState extends ROIState{}

class ROILoadedState extends ROIState{
  final List<ROIModel> customer;
  ROILoadedState(this.customer);
}

class ROIErrorState extends ROIState{
  final String error;
  ROIErrorState(this.error);
}