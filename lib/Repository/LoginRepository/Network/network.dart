
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'base_network.dart';


class Network extends BaseNetwork{


  @override
  getPost(var url, body) async{
    final parseUrl = Uri.parse(url);
    final response = await http.post(parseUrl, body: body);
    print(response.statusCode);
    return checkApiStatus(response);
  }

  @override
  getPosthWithHeader(var url, var body, var header) async{
    final parseUrl = Uri.parse(url);
    final response = await http.post(parseUrl, body: body,
        headers: header,
    );
    return checkApiStatus(response);
  }

  @override
  getApi(var url, header) async{
    final parseUrl = Uri.parse(url);
    final response = await http.get(parseUrl, headers: header);
    return checkApiStatus(response);
  }

  checkApiStatus(http.Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        return jsonDecode(response.body);
        break;
      case 404:
        throw Exception(jsonDecode(response.body));
        break;
      case 400:
        final error  = jsonDecode(response.body);
        throw Exception(error['message']);
        break;
      case 422:
        throw Exception(jsonDecode(response.body));
        break;
      default:
        throw Exception("Something went wrong try again");
        break;
    }
  }

  @override
  getPosthWithMultipart(url, body) async{

    try{

      print(body);
      final parseUrl = Uri.parse(url);
      print(parseUrl);
      var request = http.MultipartRequest("POST", parseUrl);
      request.fields['username'] = body['username'];
      request.fields['infoAbout'] = body['infoAbout'];
      request.fields['phoneNumber'] = body['phoneNumber'];
      if(body['avatar'] != '')
        {
          final file = await http.MultipartFile.fromPath('avatar', body['avatar']);
          request.files.add(file);
        }

      final response = await request.send();

      print(response.statusCode);

      if(response.statusCode == 200)
        {
          return response.stream.bytesToString();
        }
      else
        {
          return "Failed to upload";
        }


    }
    catch(e)
    {
      print(e);
    }


  }

}