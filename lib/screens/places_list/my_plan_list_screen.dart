import 'package:chi_scartlethack/models/my_plans_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../repositories/list_repositories.dart';

class MyPlansListScreen extends StatefulWidget {
  static const String routeName = '/myPlanList';

  const MyPlansListScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const MyPlansListScreen());
  }

  @override
  _MyPlansListScreenState createState() => _MyPlansListScreenState();
}

class _MyPlansListScreenState extends State<MyPlansListScreen> {
  List<MyPlanModel>? planListModel;

  @override
  void initState() {
    super.initState();
    getPlans();
  }

  Future<void> getPlans() async {
    List<MyPlanModel> a = await getPlanList();
    setState(() {
      planListModel = a;
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
          // automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text("My Plans"),
        ),
        body: planListModel == null
            ? Container()
            : ListView.builder(
                itemCount: planListModel?.length,
                itemBuilder: (context, index) {
                  MyPlanModel planModel = planListModel![index];
                  return InkWell(
                    onTap: () {
                      // HapticFeedback.mediumImpact();
                      // Navigator.of(context).pushNamed(
                      //   PlacesDetailsScreen.routeName,
                      //   arguments: planModel,
                      // );
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  planModel.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.alarm),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${DateFormat('hh:mm a').format(DateTime.parse(planModel.startTime)).toString()} - ${DateFormat('hh:mm a').format(DateTime.parse(planModel.endTime)).toString()}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await deletePlanItem(planModel.id.toString());
                                getPlans();
                              },
                              icon: Icon(Icons.delete, color: Colors.redAccent)),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
