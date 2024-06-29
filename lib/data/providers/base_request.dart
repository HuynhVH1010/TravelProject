import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

//import '../services/app_setting.dart';
import 'base_response.dart';

abstract class GetAppConnect extends GetConnect {
  void makeHeaderRequest(String time, String signature, String? access_token);
}

class BaseRequest extends GetAppConnect {
  final Duration timeOut = Duration(seconds: 60);
  static String api_url = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<Map<String,String>> makeHeaderRequest(String time, String signature, String? access_token) async {
    Map<String,String> headers = new Map();
    String langCode = "vi";
    headers['content-type'] = "application/json";
    headers['Access-Control-Allow-Origin'] = "*";
    headers['Accept'] = "application/json";
    headers['Charset'] = 'utf-8';
    headers['signature'] = signature;
    headers['language'] = langCode;
    //
    if(access_token != null && access_token.isNotEmpty)
      headers['Authorization'] = 'Bearer ${access_token}';
    //
    return headers;
  }

  Future<BaseReponse> _perserResponse(Response response) async {
    late BaseReponse js;
    try {
      int status_code = response.statusCode??0;
      switch (status_code) {
        case 200:
          var rsJson = response.body;
          //print(rsJson);
          if(rsJson != null && rsJson is Map<String, dynamic>){
            int code = rsJson['code']??-1;
            String msg = rsJson['msg']??'';
            var data = rsJson['data'];
            js = new BaseReponse(code: code, status_code: status_code, message: msg, data: data,);
          } else {
            String errorMsg = await _parserErrorMessage(response.body.toString());
            js = new BaseReponse(code: 0, status_code: status_code, message: errorMsg, data: null);
          }
          break;
        case 400://BadRequestException
          js = new BaseReponse(code: status_code, status_code: status_code, message: response.body.toString(), data: null);
          break;
        case 401:
        case 403://UnauthorisedException
          js = new BaseReponse(code: status_code, status_code: status_code, message: response.body.toString(), data: null);
          break;
        case 500:
        default://FetchDataException
          js = new BaseReponse(code: status_code, status_code: status_code, message: response.body.toString(), data: null);
          break;
      }
    } on SocketException {
      js = new BaseReponse(code: -99, status_code: -99, message: 'No internet', data: null);
    } on TimeoutException catch (e) {
      js = new BaseReponse(code: -98, status_code: -98, message: "Connection timeout", data: null);
    } on Error catch (e) {
      js = new BaseReponse(code: -97, status_code: -97, message: "Error ${e}", data: null);
    } on FormatException catch (e){
      js = new BaseReponse(code: -96, status_code: -96, message: "Error ${e}", data: null);
    }
    //
    return js;
  }

  Future<String> _parserErrorMessage(String response) async {
    if(response.isEmpty)
      return '';
    //
    String? msg = '';
    var responseJson = json.decode(response);
    if(responseJson != null && responseJson is Map<String, dynamic>){
      Map<String,dynamic> map = responseJson as Map<String,dynamic>;
      if(map.containsKey('Message'))
        msg = map['Message'];
      if(msg == null)
        msg = '';
      //
      return msg;
    } else {
      return response;
    }
  }

  //Common function
  Future<BaseReponse> call_get(String? domain, String subUrl, String? access_token) async {
    String mainUrl = BaseRequest.api_url;
    if(domain != null)
      mainUrl = domain;
    //print('Api Get, url $url');
    String time = '';
    String sign = '';
    Map<String,String> header = await makeHeaderRequest(time, sign, access_token);
    //
    String rqUrl = '${mainUrl}${subUrl}';
    final response = await get(rqUrl, headers: header).timeout(timeOut);
    BaseReponse jsonReponse = await _perserResponse(response);
    //print('api get recieved!');
    return jsonReponse;
  }

  Future<BaseReponse> call_post(String? domain, String subUrl, dynamic body, String? access_token) async {
    String mainUrl = api_url;
    if(domain != null)
      mainUrl = domain;
    //
    //print('Api Post, url $url');
    String time = '';
    String sign = '';
    Map<String,String> header = await makeHeaderRequest(time, sign, access_token);
    //
    String rqUrl = '${mainUrl}${subUrl}';
    final response = await post(rqUrl, body, headers: header,).timeout(timeOut);
    BaseReponse jsonReponse = await _perserResponse(response);
    //print('api get recieved!');
    return jsonReponse;
  }

  Future<BaseReponse> call_put(String domain, String subUrl, dynamic body) async {
    String mainUrl = api_url;
    if(domain != null && domain.length > 0)
      mainUrl = domain;
    //
    //print('Api Put, url $url');
    String rqUrl = '${mainUrl}${subUrl}';
    final response = await put(rqUrl, body).timeout(timeout);
    BaseReponse jsonReponse = await _perserResponse(response);
    //print('api get recieved!');
    return jsonReponse;
  }

  Future<BaseReponse> call_delete(String domain, String subUrl) async {
    String mainUrl = api_url;
    if(domain != null && domain.length > 0)
      mainUrl = domain;
    //
    //print('Api delete, url $url');
    String rqUrl = '${mainUrl}${subUrl}';
    final response = await delete(rqUrl).timeout(timeout);
    BaseReponse jsonReponse = await _perserResponse(response);
    //print('api get recieved!');
    return jsonReponse;
  }
}