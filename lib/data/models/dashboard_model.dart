class Account {
  String? accountId;
  int? customerId;
  String? accountType;
  int? accountBalance;
  String? accountStatus;
  double? interestRate;
  DateTime? openingDate;
  DateTime? lastTransactionDate;

  Account({this.accountId, this.customerId, this.accountType, this.accountBalance, this.accountStatus, this.interestRate, this.openingDate, this.lastTransactionDate});

  Account.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    customerId = json['customerId'];
    accountType = json['accountType'];
    accountBalance = json['accountBalance'];
    accountStatus = json['accountStatus'];
    interestRate = json['interestRate'];
    openingDate = json['openingDate'];
    lastTransactionDate = json['lastTransactionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accountId'] = accountId;
    data['customerId'] = customerId;
    data['accountType'] = accountType;
    data['accountBalance'] = accountBalance;
    data['accountStatus'] = accountStatus;
    data['interestRate'] = interestRate;
    data['openingDate'] = openingDate;
    data['lastTransactionDate'] = lastTransactionDate;
    return data;
  }
}

class InvestmentByCustomerId {
  double? mutualFunds;
  double? stocks;
  double? fixedDeposits;

  InvestmentByCustomerId({this.mutualFunds, this.stocks, this.fixedDeposits});

  InvestmentByCustomerId.fromJson(Map<String, dynamic> json) {
    mutualFunds = json['Mutual Funds'];
    stocks = json['Stocks'];
    fixedDeposits = json['Fixed Deposits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Mutual Funds'] = mutualFunds;
    data['Stocks'] = stocks;
    data['Fixed Deposits'] = fixedDeposits;
    return data;
  }
}

class Root {
  List<Account?>? accounts;
  // List<List<RecentTransactions>?>? transactions;
  InvestmentByCustomerId? investmentByCustomerId;
  TaxCalculationsDTO? taxCalculationsDTO;
  List<TopCustomerDTOList?>? topCustomerDTOList;

  Root({this.accounts, this.investmentByCustomerId, this.taxCalculationsDTO, this.topCustomerDTOList});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <Account>[];
      json['accounts'].forEach((v) {
        accounts!.add(Account.fromJson(v));
      });
    }
    // if (json['transactions'] != null) {
    //   List<RecentTransactions> transactions = List.from(json['transactions'].map((v) => RecentTransactions(v)));
    // }
    investmentByCustomerId = json['investmentByCustomerId'] != null ? InvestmentByCustomerId?.fromJson(json['investmentByCustomerId']) : null;
    taxCalculationsDTO = json['taxCalculationsDTO'] != null ? TaxCalculationsDTO?.fromJson(json['taxCalculationsDTO']) : null;
    if (json['topCustomerDTOList'] != null) {
      topCustomerDTOList = <TopCustomerDTOList>[];
      json['topCustomerDTOList'].forEach((v) {
        topCustomerDTOList!.add(TopCustomerDTOList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accounts'] =accounts != null ? accounts!.map((v) => v?.toJson()).toList() : null;
    // data['transactions'] =transactions != null ? transactions!.map((v) => v?.toJson()).toList() : null;
    data['investmentByCustomerId'] = investmentByCustomerId!.toJson();
    data['taxCalculationsDTO'] = taxCalculationsDTO!.toJson();
    data['topCustomerDTOList'] =topCustomerDTOList != null ? topCustomerDTOList!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class TaxCalculationsDTO {
  int? customerId;
  String? name;
  TaxTypeReturn? taxTypeReturn;
  double? totalTax;

  TaxCalculationsDTO({this.customerId, this.name, this.taxTypeReturn, this.totalTax});

  TaxCalculationsDTO.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    name = json['name'];
    taxTypeReturn = json['taxTypeReturn'] != null ? TaxTypeReturn?.fromJson(json['taxTypeReturn']) : null;
    totalTax = json['totalTax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customerId'] = customerId;
    data['name'] = name;
    data['taxTypeReturn'] = taxTypeReturn!.toJson();
    data['totalTax'] = totalTax;
    return data;
  }
}

class TaxTypeReturn {
  double? mutualFunds;

  TaxTypeReturn({this.mutualFunds});

  TaxTypeReturn.fromJson(Map<String, dynamic> json) {
    mutualFunds = json['Mutual Funds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Mutual Funds'] = mutualFunds;
    return data;
  }
}

class TopCustomerDTOList {
  int? customerId;
  String? customerName;
  DateTime? currentDate;
  double? returnValue;

  TopCustomerDTOList({this.customerId, this.customerName, this.currentDate, this.returnValue});

  TopCustomerDTOList.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    currentDate = json['currentDate'];
    returnValue = json['returnValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['currentDate'] = currentDate;
    data['returnValue'] = returnValue;
    return data;
  }
}

