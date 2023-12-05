import 'package:clairvoyant/data/models/tax_calculation_model.dart';

abstract class TaxAssessmentState{}

class TaxAssessmentLoadingState extends TaxAssessmentState{}

class TaxAssessmentLoadedState extends TaxAssessmentState{
  final List<TaxAssesmentModel> customer;
  TaxAssessmentLoadedState(this.customer);
}

class TaxAssessmentErrorState extends TaxAssessmentState{
  final String error;
  TaxAssessmentErrorState(this.error);
}