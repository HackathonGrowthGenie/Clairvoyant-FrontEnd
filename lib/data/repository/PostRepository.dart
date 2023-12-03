import 'dart:convert';
import 'dart:developer';
import 'package:clairvoyant/data/models/availableBalance_model.dart';
import 'package:clairvoyant/data/models/recent_transactions_model.dart';
import 'package:clairvoyant/data/models/roi_model.dart';
import 'package:clairvoyant/data/models/tax_calculation_model.dart';
import 'package:clairvoyant/data/models/topPerformingInvestment_model.dart';
import 'package:clairvoyant/data/repository/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/historical_returns_model.dart';
import '../models/popularInvestment_model.dart';
import '../models/post_model.dart';
import '../models/topInvestors_model.dart';

class CustomerRepository{
  API api =  API();
  Future<List<CustomerModel>> fetchPost(String clientId)async{
    try{
      Response response = await api.sendRequest.get("/customers/$clientId");
      Map<String, dynamic> postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => CustomerModel.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }

}

class TopInvestorsRepository{
  API api =  API();
  Future<List<TopInvesters>> fetchPost()async{
    try{
      Response response = await api.sendRequest.get("/investmentAccount/roi/topinvestors/8");
      List<dynamic> postMaps = response.data;
      return  postMaps.map((i) => TopInvesters.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }

}

class PopularInvestment{
  API api =  API();
  Future<List<PopularInvestmentModel>> fetchPost()async{
    try{
      Response response = await api.sendRequest.get("/investmentAccount/popularInvestments");
      final postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => PopularInvestmentModel.fromJson(i)).toList();

      // return (json.decode(response.data) as List)
      //      .map((i) => PopularInvestmentModel.fromJson(i))
      //      .toList();

    }
    catch(ex){
      throw ex;
    }
  }

}

class TopPerformingInvest{
  API api =  API();
  Future<List<TopPerformingInvestment>> fetchPost()async{
    try{
      Response response = await api.sendRequest.get("/investmentAccount/roi/topinvestments/All/10");
      Map<String, dynamic> postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => TopPerformingInvestment.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }

}

class HistoricalReturn{
  API api =  API();
  Future<List<HistoricalReturnsModel>> fetchPost(String clientId)async{
    try{

      Response response = await api.sendRequest.get("/investmentAccount/historical/$clientId");
      List<dynamic> postMaps = response.data;
      return  postMaps.map((i) => HistoricalReturnsModel.fromJson(i)).toList();

      // Response response = await api.sendRequest.get("/investmentAccount/historical/$clientId");
      // final postMaps = response.data;
      // return  postMaps.map((i) => HistoricalReturnsModel.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }
}

class TaxAssesment{
  API api =  API();
  Future<List<TaxAssesmentModel>> fetchPost(String clientId)async{
    try{
      Response response = await api.sendRequest.get("/api/investmentAccount/taxCalculation/$clientId");
      Map<String, dynamic> postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => TaxAssesmentModel.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }
}

class RecentTransaction{
  API api =  API();
  Future<List<RecentTransactionsModel>> fetchPost(String clientId)async{
    try{
      Response response = await api.sendRequest.get("/api/transactions/transactionsByCustomerId/$clientId");
      Map<String, dynamic> postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => RecentTransactionsModel.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }
}

class AvailableBalance{
  API api =  API();
  Future<List<AvailableBalanceModel>> fetchPost(String clientId)async{
    try{
      Response response = await api.sendRequest.get("/api/investmentAccount/getInvestmentByCustomerId/$clientId");
      Map<String, dynamic> postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => AvailableBalanceModel.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }
}

class ROI{
  API api =  API();
  Future<List<ROIModel>> fetchPost(String clientId)async{
    try{
      Response response = await api.sendRequest.get("/api/investmentAccount/roi/$clientId");
      Map<String, dynamic> postMaps = response.data;
      List list = [];
      list.add(postMaps);
      return  list.map((i) => ROIModel.fromJson(i)).toList();
    }
    catch(ex){
      throw ex;
    }
  }
}

