class PopularInvestmentModel {
  MutualFunds? mutualFunds;
  Stocks? stocks;
  FixedDeposits? fixedDeposits;

  PopularInvestmentModel({this.mutualFunds, this.stocks, this.fixedDeposits});

  PopularInvestmentModel.fromJson(Map<String, dynamic> json) {
    mutualFunds = json['Mutual Funds'] != null
        ? new MutualFunds.fromJson(json['Mutual Funds'])
        : null;
    stocks =
    json['Stocks'] != null ? new Stocks.fromJson(json['Stocks']) : null;
    fixedDeposits = json['Fixed Deposits'] != null
        ? new FixedDeposits.fromJson(json['Fixed Deposits'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mutualFunds != null) {
      data['Mutual Funds'] = this.mutualFunds!.toJson();
    }
    if (this.stocks != null) {
      data['Stocks'] = this.stocks!.toJson();
    }
    if (this.fixedDeposits != null) {
      data['Fixed Deposits'] = this.fixedDeposits!.toJson();
    }
    return data;
  }
}

class MutualFunds {
  int? kotakMahindraMutualFund;
  int? canaraRobecoMutualFund;
  int? equitiesAxisMutualFund;
  int? nipponIndiaMutualFund;
  int? dSPMutualFund;
  int? axisMutualFund;
  int? iCICIPrudentialMutualFund;
  int? adityaBirlaSunLifeMutualFund;
  int? sBIMutualFund;
  int? uTIMutualFund;

  MutualFunds(
      {this.kotakMahindraMutualFund,
        this.canaraRobecoMutualFund,
        this.equitiesAxisMutualFund,
        this.nipponIndiaMutualFund,
        this.dSPMutualFund,
        this.axisMutualFund,
        this.iCICIPrudentialMutualFund,
        this.adityaBirlaSunLifeMutualFund,
        this.sBIMutualFund,
        this.uTIMutualFund});

  MutualFunds.fromJson(Map<String, dynamic> json) {
    kotakMahindraMutualFund = json['Kotak Mahindra Mutual Fund'];
    canaraRobecoMutualFund = json['Canara Robeco Mutual Fund'];
    equitiesAxisMutualFund = json['Equities - Axis Mutual Fund'];
    nipponIndiaMutualFund = json['Nippon India Mutual Fund'];
    dSPMutualFund = json['DSP Mutual Fund'];
    axisMutualFund = json['Axis Mutual Fund'];
    iCICIPrudentialMutualFund = json['ICICI Prudential Mutual Fund'];
    adityaBirlaSunLifeMutualFund = json['Aditya Birla Sun Life Mutual Fund'];
    sBIMutualFund = json['SBI Mutual Fund'];
    uTIMutualFund = json['UTI Mutual Fund'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kotak Mahindra Mutual Fund'] = this.kotakMahindraMutualFund;
    data['Canara Robeco Mutual Fund'] = this.canaraRobecoMutualFund;
    data['Equities - Axis Mutual Fund'] = this.equitiesAxisMutualFund;
    data['Nippon India Mutual Fund'] = this.nipponIndiaMutualFund;
    data['DSP Mutual Fund'] = this.dSPMutualFund;
    data['Axis Mutual Fund'] = this.axisMutualFund;
    data['ICICI Prudential Mutual Fund'] = this.iCICIPrudentialMutualFund;
    data['Aditya Birla Sun Life Mutual Fund'] =
        this.adityaBirlaSunLifeMutualFund;
    data['SBI Mutual Fund'] = this.sBIMutualFund;
    data['UTI Mutual Fund'] = this.uTIMutualFund;
    return data;
  }
}

class Stocks {
  int? heroMotoCorpLimited;
  int? bajajFinservLimited;
  int? ciplaLimited;
  int? sunPharmaceuticalIndustriesLimited;
  int? wiproLimited;
  int? hDFCBankLimited;
  int? housingDevelopmentFinanceCorporationLimited;
  int? britanniaIndustriesLimited;
  int? infosysLimited;
  int? adaniPortsAndSpecialEconomicZoneLimited;

  Stocks(
      {this.heroMotoCorpLimited,
        this.bajajFinservLimited,
        this.ciplaLimited,
        this.sunPharmaceuticalIndustriesLimited,
        this.wiproLimited,
        this.hDFCBankLimited,
        this.housingDevelopmentFinanceCorporationLimited,
        this.britanniaIndustriesLimited,
        this.infosysLimited,
        this.adaniPortsAndSpecialEconomicZoneLimited});

  Stocks.fromJson(Map<String, dynamic> json) {
    heroMotoCorpLimited = json['Hero MotoCorp Limited'];
    bajajFinservLimited = json['Bajaj Finserv Limited'];
    ciplaLimited = json['Cipla Limited'];
    sunPharmaceuticalIndustriesLimited =
    json['Sun Pharmaceutical Industries Limited'];
    wiproLimited = json['Wipro Limited'];
    hDFCBankLimited = json['HDFC Bank Limited'];
    housingDevelopmentFinanceCorporationLimited =
    json['Housing Development Finance Corporation Limited'];
    britanniaIndustriesLimited = json['Britannia Industries Limited'];
    infosysLimited = json['Infosys Limited'];
    adaniPortsAndSpecialEconomicZoneLimited =
    json['Adani Ports and Special Economic Zone Limited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Hero MotoCorp Limited'] = this.heroMotoCorpLimited;
    data['Bajaj Finserv Limited'] = this.bajajFinservLimited;
    data['Cipla Limited'] = this.ciplaLimited;
    data['Sun Pharmaceutical Industries Limited'] =
        this.sunPharmaceuticalIndustriesLimited;
    data['Wipro Limited'] = this.wiproLimited;
    data['HDFC Bank Limited'] = this.hDFCBankLimited;
    data['Housing Development Finance Corporation Limited'] =
        this.housingDevelopmentFinanceCorporationLimited;
    data['Britannia Industries Limited'] = this.britanniaIndustriesLimited;
    data['Infosys Limited'] = this.infosysLimited;
    data['Adani Ports and Special Economic Zone Limited'] =
        this.adaniPortsAndSpecialEconomicZoneLimited;
    return data;
  }
}

class FixedDeposits {
  int? daily;
  int? monthly;
  int? weekly;
  int? yearly;
  int? halfYearly;
  int? quarterly;

  FixedDeposits(
      {this.daily,
        this.monthly,
        this.weekly,
        this.yearly,
        this.halfYearly,
        this.quarterly});

  FixedDeposits.fromJson(Map<String, dynamic> json) {
    daily = json['Daily'];
    monthly = json['Monthly'];
    weekly = json['Weekly'];
    yearly = json['Yearly'];
    halfYearly = json['Half Yearly'];
    quarterly = json['Quarterly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Daily'] = this.daily;
    data['Monthly'] = this.monthly;
    data['Weekly'] = this.weekly;
    data['Yearly'] = this.yearly;
    data['Half Yearly'] = this.halfYearly;
    data['Quarterly'] = this.quarterly;
    return data;
  }
}