///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
const String jsonKeyServiceId = "id";
const String jsonKeyServiceName = "name";
const String jsonKeyServiceNameAr = "name_ar";

class Service {
/*
{
  "id": 6,
  "name": "Maintenance",
  "name_ar": "صيانة"
}
*/

  int? id;
  String? name;
  String? nameAr;

  Service({
    this.id,
    this.name,
    this.nameAr,
  });
  Service.fromJson(Map<String, dynamic> json) {
    id = json[jsonKeyServiceId]?.toInt();
    name = json[jsonKeyServiceName]?.toString();
    nameAr = json[jsonKeyServiceNameAr]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[jsonKeyServiceId] = id;
    data[jsonKeyServiceName] = name;
    data[jsonKeyServiceNameAr] = nameAr;
    return data;
  }
}
