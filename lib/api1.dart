// import 'package:http/http.dart' as http;
// import 'constants.dart' as Constant;

// class KialllistaService {
//    static Future<List<Kialllista>> findAll(String user, String pridlist, String lngid, String sessionid) async {
//
//       // pridlist=IND20&orgid=00158376&lngid=hu&pagesize=50&mode=K&up=1&upevent=ipar-napjai
//       // final String params = "user=" + (user ?? "") +
//       //     "&" + "pridlist=" + (pridlist ?? "") +
//       //     "&" + "lngid=" + (lngid ?? "") +
//       //     "&" + "sessionid=" + (sessionid ?? "");
//
//       final String params = "pridlist=CSA20&lngid=hu&mode=K&output=json" ;
//
//       final String url = Constant.HTTP_URL_PROD_ROOT + "?" + Constant.HTTP_BASE_URL_ROUTE_KIALLLISTA_KIALLLISTA1 + '&' + params;
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//          Iterable list = json.decode(response.body);
//          return list.map((item) => Module.fromJson(item)).toList();
//       } else {
//          throw Exception(allTranslations.text('failed_to_load') + ' ModuleService.findAll.List<Module>');
//       }
//    }
// }

// class Test1 {
//    Future<http.Response> fetchAll() {
//       final String url = "https://eregistrator.hu/6/index.php?r=kialllista/kialllista1/list&pridlist=IND20&orgid=00158376&lngid=hu&pagesize=50&mode=K&up=1&upevent=ipar-napjai&output=json" ;
//       return http.get(url);
//    }
//
// }

class Kiallito {
   final String name;
   final String group;

   Kiallito({this.name, this.group});

   factory Kiallito.fromJson(Map<String, dynamic> json) {
      return Kiallito(
         name: json['name'],
         group: json['group'],
      );
   }

   @override
   String toString() => '$runtimeType(${this.name}, \"${this.group}\")';
}

