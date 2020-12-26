import 'package:http/http.dart' as http;
import 'dart:convert';
/*  http status codes cheet sheet
100: hold on
200: here you go 
300:  Go away(redirection)
400:  you messed up(bad request,unauthorised)
500: i(server) messed up
*/

class NetworkHelper {
  final String url; 
  NetworkHelper({this.url});
  var decodedData;
  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);  //uses dart:convert
    } else {
      print(response.statusCode);
    }
    return decodedData;
  } //getData
}
