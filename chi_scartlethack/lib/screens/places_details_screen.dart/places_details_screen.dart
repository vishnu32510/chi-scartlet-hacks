import 'package:chi_scartlethack/repositories/list_repositories.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/places_model.dart';

class PlacesDetailsScreen extends StatefulWidget {
  static const String routeName = '/placesDetails';
  final PlacesModel placesModel;

  const PlacesDetailsScreen({super.key, required this.placesModel});

  static Route route(PlacesModel placesModelArg) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName, arguments: placesModelArg),
        builder: (context) => PlacesDetailsScreen(
              placesModel: placesModelArg,
            ));
  }

  @override
  _PlacesDetailsScreenState createState() => _PlacesDetailsScreenState();
}

class _PlacesDetailsScreenState extends State<PlacesDetailsScreen> {
  late PlacesModel placesModel;

  @override
  void initState() {
    super.initState();
    placesModel = widget.placesModel;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(placesModel.title),
        ),
        body: Container(
           height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(), //Border.all
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    child: Hero(tag: placesModel.id, child: Image.network(placesModel.image)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          placesModel.title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          placesModel.description,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RwoDetails(title: "Location:", value: placesModel.location),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(placesModel.sourceLink))) {
                              launchUrl(Uri.parse(placesModel.sourceLink));
                            }
                          },
                          child: RwoDetails(
                              title: "Source Link:",
                              value: placesModel.sourceLink,
                              valueColor: Colors.lightBlue),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RwoDetails(
                            title: "Timings:",
                            value:
                                "${DateFormat('hh:mm a').format(DateTime.parse(placesModel.openTime)).toString()} - ${DateFormat('hh:mm a').format(DateTime.parse(placesModel.closeTime)).toString()}"),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            onPressed: () async {
                              late TimeOfDay? endTime;
                              TimeOfDay? startTime = await showTimePicker(
                                  initialEntryMode: TimePickerEntryMode.input,
                                  context: context,
                                  initialTime: TimeOfDay(hour: 8, minute: 0),
                                  barrierLabel: "Start Time");
                              if (startTime != null) {
                                endTime = await showTimePicker(
                                    initialEntryMode: TimePickerEntryMode.input,
                                    context: context,
                                    initialTime: startTime,
                                    barrierLabel: "End Time");
                              }
                              if (endTime != null && startTime != null) {
                                var added = await addToMyPlan(startTime, endTime, placesModel.id.toString());
                                showDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.black.withOpacity(0.5),
                                context: context,
                                builder: (BuildContext context) {
                                  return Expanded(
                                    child: AlertDialog(
                                      title: Text('Plan Addition ${added!=null?"Failed":"Sucessfull"}'),
                                      content: Text('${added!=null?added:""}',style: TextStyle(fontSize: 16),),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.cyan,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text(
                                "Add to my Plan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class RwoDetails extends StatelessWidget {
  const RwoDetails({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
  });

  final String title;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
