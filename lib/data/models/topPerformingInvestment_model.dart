// class TopPerformingInvestment {
class TopPerformingInvestment {
  List<MutualFunds>? mutualFunds;
  List<Stocks>? stocks;
  List<FixedDeposits>? fixedDeposits;

  TopPerformingInvestment({this.mutualFunds, this.stocks, this.fixedDeposits});

  TopPerformingInvestment.fromJson(Map<String, dynamic> json) {
    if (json['Mutual Funds'] != null) {
      mutualFunds = <MutualFunds>[];
      json['Mutual Funds'].forEach((v) {
        mutualFunds!.add(new MutualFunds.fromJson(v));
      });
    }
    if (json['Stocks'] != null) {
      stocks = <Stocks>[];
      json['Stocks'].forEach((v) {
        stocks!.add(new Stocks.fromJson(v));
      });
    }
    if (json['Fixed Deposits'] != null) {
      fixedDeposits = <FixedDeposits>[];
      json['Fixed Deposits'].forEach((v) {
        fixedDeposits!.add(new FixedDeposits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mutualFunds != null) {
      data['Mutual Funds'] = this.mutualFunds!.map((v) => v.toJson()).toList();
    }
    if (this.stocks != null) {
      data['Stocks'] = this.stocks!.map((v) => v.toJson()).toList();
    }
    if (this.fixedDeposits != null) {
      data['Fixed Deposits'] =
          this.fixedDeposits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MutualFunds {
  int? mututalFundId;
  String? investmentAccountId;
  String? fundName;
  String? fundManger;
  String? fundType;
  double? nav;
  double? investmentAmount;
  int? investmentDate;

  MutualFunds(
      {this.mututalFundId,
        this.investmentAccountId,
        this.fundName,
        this.fundManger,
        this.fundType,
        this.nav,
        this.investmentAmount,
        this.investmentDate});

  MutualFunds.fromJson(Map<String, dynamic> json) {
    mututalFundId = json['mututalFundId'];
    investmentAccountId = json['investmentAccountId'];
    fundName = json['fundName'];
    fundManger = json['fundManger'];
    fundType = json['fundType'];
    nav = json['nav'];
    investmentAmount = json['investmentAmount'];
    investmentDate = json['investmentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mututalFundId'] = this.mututalFundId;
    data['investmentAccountId'] = this.investmentAccountId;
    data['fundName'] = this.fundName;
    data['fundManger'] = this.fundManger;
    data['fundType'] = this.fundType;
    data['nav'] = this.nav;
    data['investmentAmount'] = this.investmentAmount;
    data['investmentDate'] = this.investmentDate;
    return data;
  }
}

class Stocks {
  String? stockName;
  String? stockSymbol;
  String? stockExchange;
  double? returns;

  Stocks({this.stockName, this.stockSymbol, this.stockExchange, this.returns});

  Stocks.fromJson(Map<String, dynamic> json) {
    stockName = json['stockName'];
    stockSymbol = json['stockSymbol'];
    stockExchange = json['stockExchange'];
    returns = json['returns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockName'] = this.stockName;
    data['stockSymbol'] = this.stockSymbol;
    data['stockExchange'] = this.stockExchange;
    data['returns'] = this.returns;
    return data;
  }
}

class FixedDeposits {
  String? fixedDepositId;
  String? investmentAccountId;
  double? principalAmount;
  double? interestRate;
  int? maturityRate;
  String? interestPaymentFrequency;
  double? maturityAmount;

  FixedDeposits(
      {this.fixedDepositId,
        this.investmentAccountId,
        this.principalAmount,
        this.interestRate,
        this.maturityRate,
        this.interestPaymentFrequency,
        this.maturityAmount});

  FixedDeposits.fromJson(Map<String, dynamic> json) {
    fixedDepositId = json['fixedDepositId'];
    investmentAccountId = json['investmentAccountId'];
    principalAmount = json['principalAmount'];
    interestRate = json['interestRate'];
    maturityRate = json['maturityRate'];
    interestPaymentFrequency = json['interestPaymentFrequency'];
    maturityAmount = json['maturityAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fixedDepositId'] = this.fixedDepositId;
    data['investmentAccountId'] = this.investmentAccountId;
    data['principalAmount'] = this.principalAmount;
    data['interestRate'] = this.interestRate;
    data['maturityRate'] = this.maturityRate;
    data['interestPaymentFrequency'] = this.interestPaymentFrequency;
    data['maturityAmount'] = this.maturityAmount;
    return data;
  }
}