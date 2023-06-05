class AddPropertyModel{
  late String selectBuildingType;
  late String selectFlatType;
  late String buildingName;
  late String flatName;
  late String address;
  late String propertySize;
  late int roomCount;
  late int bathroomCount;
  late int bedroomCount;
  late int description;
  late List<String> photoUrl;

  AddPropertyModel(
      {required this.selectBuildingType,
        required this.selectFlatType,
        required this.buildingName,
        required this.flatName,
        required this.address,
        required this.propertySize,
        required this.roomCount,
        required  this.bathroomCount,
        required this.bedroomCount,
        required this.description,
        required this.photoUrl});
}