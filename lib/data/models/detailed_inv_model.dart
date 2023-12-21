class DetailedInvModel {
  int? customerId;
  String? customerName;
  List<StocksDetails>? stocksDetails;
  List<MutualFundDetails>? mutualFundDetails;
  List<FixedDepositsDetails>? fixedDepositsDetails;
  List<LoansDetails>? loansDetails;

  DetailedInvModel(
      {this.customerId,
        this.customerName,
        this.stocksDetails,
        this.mutualFundDetails,
        this.fixedDepositsDetails,
        this.loansDetails});

  DetailedInvModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    if (json['stocksDetails'] != null) {
      stocksDetails = <StocksDetails>[];
      json['stocksDetails'].forEach((v) {
        stocksDetails!.add(new StocksDetails.fromJson(v));
      });
    }
    if (json['mutualFundDetails'] != null) {
      mutualFundDetails = <MutualFundDetails>[];
      json['mutualFundDetails'].forEach((v) {
        mutualFundDetails!.add(new MutualFundDetails.fromJson(v));
      });
    }
    if (json['fixedDepositsDetails'] != null) {
      fixedDepositsDetails = <FixedDepositsDetails>[];
      json['fixedDepositsDetails'].forEach((v) {
        fixedDepositsDetails!.add(new FixedDepositsDetails.fromJson(v));
      });
    }
    if (json['loansDetails'] != null) {
      loansDetails = <LoansDetails>[];
      json['loansDetails'].forEach((v) {
        loansDetails!.add(new LoansDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    if (this.stocksDetails != null) {
      data['stocksDetails'] =
          this.stocksDetails!.map((v) => v.toJson()).toList();
    }
    if (this.mutualFundDetails != null) {
      data['mutualFundDetails'] =
          this.mutualFundDetails!.map((v) => v.toJson()).toList();
    }
    if (this.fixedDepositsDetails != null) {
      data['fixedDepositsDetails'] =
          this.fixedDepositsDetails!.map((v) => v.toJson()).toList();
    }
    if (this.loansDetails != null) {
      data['loansDetails'] = this.loansDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StocksDetails {
  int? stockId;
  String? stockName;
  String? stockSymbol;
  String? stockExchange;
  double? purchasePrice;
  String? purchaseDate;
  int? quantity;
  String? investmentAccountID;

  StocksDetails(
      {this.stockId,
        this.stockName,
        this.stockSymbol,
        this.stockExchange,
        this.purchasePrice,
        this.purchaseDate,
        this.quantity,
        this.investmentAccountID});

  StocksDetails.fromJson(Map<String, dynamic> json) {
    stockId = json['stockId'];
    stockName = json['stockName'];
    stockSymbol = json['stockSymbol'];
    stockExchange = json['stockExchange'];
    purchasePrice = json['purchasePrice'];
    purchaseDate = json['purchaseDate'];
    quantity = json['quantity'];
    investmentAccountID = json['investmentAccountID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockId'] = this.stockId;
    data['stockName'] = this.stockName;
    data['stockSymbol'] = this.stockSymbol;
    data['stockExchange'] = this.stockExchange;
    data['purchasePrice'] = this.purchasePrice;
    data['purchaseDate'] = this.purchaseDate;
    data['quantity'] = this.quantity;
    data['investmentAccountID'] = this.investmentAccountID;
    return data;
  }
}

class MutualFundDetails {
  int? mututalFundId;
  String? investmentAccountId;
  String? fundName;
  String? fundManger;
  String? fundType;
  double? nav;
  double? investmentAmount;
  String? investmentDate;

  MutualFundDetails(
      {this.mututalFundId,
        this.investmentAccountId,
        this.fundName,
        this.fundManger,
        this.fundType,
        this.nav,
        this.investmentAmount,
        this.investmentDate});

  MutualFundDetails.fromJson(Map<String, dynamic> json) {
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

class FixedDepositsDetails {
  String? fixedDepositId;
  String? investmentAccountId;
  double? principalAmount;
  double? interestRate;
  String? maturityRate;
  String? interestPaymentFrequency;
  double? maturityAmount;

  FixedDepositsDetails(
      {this.fixedDepositId,
        this.investmentAccountId,
        this.principalAmount,
        this.interestRate,
        this.maturityRate,
        this.interestPaymentFrequency,
        this.maturityAmount});

  FixedDepositsDetails.fromJson(Map<String, dynamic> json) {
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

class LoansDetails {
  int? loanId;
  int? customerId;
  String? loanType;
  double? loanAmount;
  double? interestRate;
  String? loanStatus;
  double? emi;
  int? loanTerm;
  String? disbursmentDate;
  String? repaymentSchedule;

  LoansDetails(
      {this.loanId,
        this.customerId,
        this.loanType,
        this.loanAmount,
        this.interestRate,
        this.loanStatus,
        this.emi,
        this.loanTerm,
        this.disbursmentDate,
        this.repaymentSchedule});

  LoansDetails.fromJson(Map<String, dynamic> json) {
    loanId = json['loanId'];
    customerId = json['customerId'];
    loanType = json['loanType'];
    loanAmount = json['loanAmount'];
    interestRate = json['interestRate'];
    loanStatus = json['loanStatus'];
    emi = json['emi'];
    loanTerm = json['loanTerm'];
    disbursmentDate = json['disbursmentDate'];
    repaymentSchedule = json['repaymentSchedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loanId'] = this.loanId;
    data['customerId'] = this.customerId;
    data['loanType'] = this.loanType;
    data['loanAmount'] = this.loanAmount;
    data['interestRate'] = this.interestRate;
    data['loanStatus'] = this.loanStatus;
    data['emi'] = this.emi;
    data['loanTerm'] = this.loanTerm;
    data['disbursmentDate'] = this.disbursmentDate;
    data['repaymentSchedule'] = this.repaymentSchedule;
    return data;
  }
}
