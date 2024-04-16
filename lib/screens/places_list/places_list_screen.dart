import 'package:chi_scartlethack/screens/places_details_screen.dart/places_details_screen.dart';
import 'package:chi_scartlethack/screens/places_list/my_plan_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../core/utils/app_constants.dart';
import '../../models/places_model.dart';
import '../../repositories/list_repositories.dart';

class PlacesList extends StatefulWidget {
  static const String routeName = '/placesList';

  const PlacesList({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (context) => const PlacesList());
  }

  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  List<PlacesModel>? placesList;

  @override
  void initState() {
    super.initState();
    getArtList();
  }

  Future<void> getArtList() async {
    List<PlacesModel> a = await getList();
    setState(() {
      placesList = a;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text(AppConstants.appTitle),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.cyan,
          onPressed: () {
            HapticFeedback.mediumImpact();
            Navigator.of(context).pushNamed(
              MyPlansListScreen.routeName,
            );
          },
          label: Text("My Plans"),
        ),
        body: placesList == null
            ? Container()
            : ListView.builder(
                itemCount: placesList?.length,
                itemBuilder: (context, index) {
                  PlacesModel placesModel = placesList![index];
                  return InkWell(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      Navigator.of(context).pushNamed(
                        PlacesDetailsScreen.routeName,
                        arguments: placesModel,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black), //Border.all
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            placesModel.title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Hero(tag: placesModel.id, child: Image.network(placesModel.image))
                        ],
                      ),
                    ),
                  );
                }));
  }
}
