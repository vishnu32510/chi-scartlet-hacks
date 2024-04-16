import 'package:chi_scartlethack/core/services/services.dart';
import 'package:chi_scartlethack/models/my_plans_model.dart';
import 'package:flutter/material.dart';
import '../core/utils/app_constants.dart';
import '../models/places_model.dart';
// import 'package:flutter/material.dart';
// import 'package:unsplash_api/constants.dart';
// import 'package:unsplash_api/models/models.dart';

Future<List<PlacesModel>> getList() async {
  const String url = AppConstants.baseUrl;
  var response = await HttpServices().getMethod(url);
  var data = response;
  List list = data as List;
  List<PlacesModel> placesList = list.map((e) => PlacesModel.fromJson(e)).toList();
  return placesList;
}

Future<dynamic> deletePlanItem(String itemId) async {
  String url = AppConstants.baseUrl +"plans/" +itemId;
  var response = await HttpServices().deleteMethod(url);
  return response;
}

Future<List<MyPlanModel>> getPlanList() async {
  const String url = AppConstants.baseUrl+"plans";
  var response = await HttpServices().getMethod(url);
  var data = response;
  List list = data as List;
  List<MyPlanModel> planList = list.map((e) => MyPlanModel.fromJson(e)).toList();
  return planList;
}

Future<dynamic>? addToMyPlan(TimeOfDay startTime, TimeOfDay endTime, String id) async {
  const String url = AppConstants.baseUrl + "plans";
  final now = new DateTime.now();
  Map<String,dynamic> body = {
  "plan": {
    "place_id": id,
    "start_time": DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute).toString(),
    "end_time": DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute).toString()
  }
};
  var response = await HttpServices().postMethod(
    url, body
  );
  var data = response["error"];
  return data;
}

// Future searchView(int page, int length,String url,String search,BuildContext context) async {


//   // var response = await http.get(url);
//   // var data = jsonDecode(response.body);
//   // var response = await Dio().get('https://api.unsplash.com/photos/?client_id=4flU2VputqN2M8QwJI5jWaI4KyIYAbYKbsXKatwwy7U',queryParameters: {'page' : page, 'per_page': length});
//   // print(baseurl+url+clientid);
//   var response = await Dio().get('$baseUrl$url$clientId',queryParameters: {'page' : page, 'per_page': length, 'query' : search});
//   var data = response.data;
//   print(data);
//   print(data['results']);


//   final snackBar = SnackBar(
//     content: Text(
//       '${data['total']} results found',
//       style: TextStyle(
//         fontStyle: FontStyle.italic,
//       ),
//     ),
//     action: SnackBarAction(
//       label: 'Dismiss',
//       onPressed: () {
//       },
//     ),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);

//   var re = PhotoList.fromJson(data['results']);
//   print(re.photos.length);
//   return re;
// }

