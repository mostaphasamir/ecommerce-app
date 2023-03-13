import 'dart:convert';


import 'package:ecommerce/core/api/constance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Api
{
  Future<dynamic> get({required String url ,String? token,lang ='en'})async
  {
    http.Response response =await http.get(
      Uri.parse(url),
      headers: AppApiConstance.baseHeaders ,
    );
    if(response.statusCode==200||response.statusCode==201)
    {
      return jsonDecode(response.body);
    }
    else
    {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({required String url,@required dynamic body,Map<String, String>? headers})async
  {
    http.Response response=await http.post(
        Uri.parse(url),
        body :body,
      headers: headers ,

    );
    print(response.body.toString());
    if(response.statusCode==200||response.statusCode==201)
    {
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }
    else
    {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> update({required String url,@required dynamic body})async
  {
    http.Response response=await http.post(Uri.parse(url),body: body);
    if(response.statusCode==200)
    {
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }
    else
    {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }
}



