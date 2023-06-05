import 'package:kraya/model/add_property.dart';

abstract class AddProperty{
  Future<bool> addProperty(AddPropertyModel addPropertyModel);
}