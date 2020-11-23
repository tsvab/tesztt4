import 'package:http/http.dart' as http;
//import 'dart:async';
import 'dart:convert';

Future<List<dynamic>> fetchKiallito() async {

  final String url = "https://eregistrator.hu/6/index.php?r=kialllista/kialllista1/list&pridlist=IND20&orgid=00158376&lngid=hu&pagesize=50&mode=K&up=1&upevent=ipar-napjai&output=json" ;
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Kiallito.fromJson(jsonDecode(response.body))
print( 'response statuscode: ${response.statusCode}');
    Iterable list = jsonDecode(response.body) ;

    return list ;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

