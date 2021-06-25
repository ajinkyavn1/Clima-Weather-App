import 'package:http/http.dart'as http;
import 'dart:convert';
class NetworkHelper{
  String url;
  NetworkHelper(this.url);
  Future getData()async{

    http.Response response=await http.get(url);
    print(url);
    if(response.statusCode==200){
      String data=response.body;
      var json=jsonDecode(data);

      return json['list'][0];
    }else{
      print("Request Faild");
    }

  }
}