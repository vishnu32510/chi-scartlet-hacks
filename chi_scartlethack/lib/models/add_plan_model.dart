class AddPlanModel {
  AddPlanModel({
    required this.planId,
    required this.startTime,
    required this.endTime,
  });
  late final int planId;
  late final String startTime;
  late final String endTime;
  
  AddPlanModel.fromJson(Map<String, dynamic> json){
    planId = json['plan_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['plan_id'] = planId;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    return _data;
  }
}