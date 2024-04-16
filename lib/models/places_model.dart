class PlacesModel {
  PlacesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.location,
    required this.sourceLink,
    required this.createdAt,
    required this.updatedAt,
    required this.openTime,
    required this.closeTime,
    required this.category,
  });
  late final int id;
  late final String title;
  late final String image;
  late final String description;
  late final String location;
  late final String sourceLink;
  late final String createdAt;
  late final String updatedAt;
    late final String openTime;
  late final String closeTime;
  late final List<String> category;
  
  PlacesModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    sourceLink = json['source_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
    category = List.castFrom<dynamic, String>(json['category']);
  }

}