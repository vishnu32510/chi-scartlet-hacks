class MyPlanModel {
  MyPlanModel({
    required this.id,
    required this.placeId,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.image,
    required this.description,
    required this.location,
    required this.sourceLink,
    required this.openTime,
    required this.closeTime,
  });
  late final int id;
  late final int placeId;
  late final String startTime;
  late final String endTime;
  late final String createdAt;
  late final String updatedAt;
  late final String title;
  late final String image;
  late final String description;
  late final String location;
  late final String sourceLink;
  late final String openTime;
  late final String closeTime;
  
  MyPlanModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeId = json['place_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    sourceLink = json['source_link'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['place_id'] = placeId;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['title'] = title;
    _data['image'] = image;
    _data['description'] = description;
    _data['location'] = location;
    _data['source_link'] = sourceLink;
    _data['open_time'] = openTime;
    _data['close_time'] = closeTime;
    return _data;
  }
}