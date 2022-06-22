
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/data_model.dart';

class DataServices{

  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async{
    var apiUrl = '/getplaces';
    //the get method returns a api in json format
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      //code 200 means correct response in http
      if(res.statusCode == 200){
        //decoding api from json format to a list format
        List<dynamic> responseList = json.decode(res.body);
        return responseList.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e.toString());
      return <DataModel>[];
    }
  }
}