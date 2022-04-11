import 'package:http/http.dart';

class Network{
  final String? url;

  Network(this.url);

  Future getDate() async{
   print("Calling URI : $url");
   Response response = await get(Uri.parse(url!));
   if(response.statusCode == 200){
     return response.body;
   }else{
     print(response.statusCode);
   }

  }
}