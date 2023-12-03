class TopInvesters {
  String? name;
  String? investmentType;
  double? returns;
  int? portfolio;

  TopInvesters({this.name, this.investmentType, this.returns, this.portfolio});

  TopInvesters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    investmentType = json['investmentType'];
    returns = json['returns'];
    portfolio = json['portfolio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['investmentType'] = this.investmentType;
    data['returns'] = this.returns;
    data['portfolio'] = this.portfolio;
    return data;
  }
}