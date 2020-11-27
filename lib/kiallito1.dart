import 'package:http/http.dart' as http;
//import 'dart:async';
import 'dart:convert';

class Kiallito {
  final String ppid;
  final String cegnev;
  final String urllogo;
  final List standlista;
  final String magunkrol;
  final bool favourite;

  Kiallito(
      {this.ppid = '',
      this.cegnev = '',
      this.urllogo = '',
      this.standlista,
      this.magunkrol = '',
      this.favourite = false});

  String get helylist {
    String ret = '';
    this.standlista.forEach((element) {
      if (ret != '') {
        ret += ', ';
      }
      ret += element['nevpavilon'] + ' ' + element['stand'];
    });

    return ret;
  }

  factory Kiallito.fromJson(Map<String, dynamic> json) {
    return Kiallito(
      ppid: json['ppid'],
      cegnev: json['cegnev'],
      urllogo: json['urllogo'],
      standlista: json['standlista'] ?? [],
      magunkrol: json['magunkrol'] ?? '',
    );
  }

  @override
  String toString() =>
      '$runtimeType(${this.ppid}, \"${this.cegnev}\", \"${this.urllogo}\", \"${this.standlista}\")';
}

Future<List<dynamic>> fetchKiallitok() async {
  final String url =
      "https://eregistrator.hu/6/index.php?r=kialllista/kialllista1/list&pridlist=CSA19&orgid=00158376&lngid=hu&pagesize=50&mode=K&up=1&upevent=ipar-napjai&app=1";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Kiallito.fromJson(jsonDecode(response.body))
    //print('response statuscode: ${response.statusCode}');
    Iterable list = jsonDecode(response.body);

    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Kiallito> fetchKiallito(String ppid) async {
  final String url =
      //"https://eregistrator.hu/6/index.php?r=kialllista/kialllista1/list&pridlist=CSA19&orgid=00158376&lngid=hu&pagesize=50&mode=K&up=1&upevent=ipar-napjai&app=1";
      "https://eregistrator.hu/6/index.php?r=kialllista/kialllista1/ppid&ppid=" +
          ppid +
          "&pridlist=CSA19&orgid=00158376&lngid=hu&bl=%2F6%2Findex.php%3Fajax%3Dkialllist1-grid%26ap8p%3D1%26lngid%3Dhu%26mode%3DK%26orgid%3D00158376%26page%3D3%26pagesize%3D50%26pridlist%3DCSA19%26r%3Dkialllista%252Fkialllista1%252Flist%26up%3D1%26upevent%3Dconstruma&up=1&upevent=construma&mode=K&elogtext1=&app=1";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Kiallito.fromJson(jsonDecode(response.body))
    //print('response statuscode: ${response.statusCode}');
    //Kiallito kiallito = jsonDecode(response.body);
    //print(jsonDecode(response.body));

    Kiallito kiallito;
    kiallito = Kiallito.fromJson(json.decode(response.body));
    //print(kiallito);

    return kiallito;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
