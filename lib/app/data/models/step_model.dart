import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Step {
  Step({
    this.id,
    this.index,
    this.name,
    this.options,
  });

  factory Step.fromJson(Map<String, dynamic> jsonRes) {
    final List<Options>? options = jsonRes['options'] is List ? <Options>[] : null;
    if (options != null) {
      for (final dynamic item in jsonRes['options']!) {
        if (item != null) {
          options.add(Options.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Step(
      id: asT<int?>(jsonRes['id']),
      index: asT<int?>(jsonRes['index']),
      name: asT<String?>(jsonRes['name']),
      options: options,
    );
  }

  int? id;
  int? index;
  String? name;
  List<Options>? options;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'index': index,
        'name': name,
        'options': options,
      };

  Step copy() {
    return Step(
      id: id,
      index: index,
      name: name,
      options: options?.map((Options e) => e.copy()).toList(),
    );
  }
}

class Options {
  Options({
    this.description,
    this.descriptionAr,
    this.id,
    this.index,
    this.name,
    this.nameAr,
    this.settings,
    this.stepId,
    this.type,
  });

  factory Options.fromJson(Map<String, dynamic> jsonRes) => Options(
        description: asT<String?>(jsonRes['description']),
        descriptionAr: asT<String?>(jsonRes['description_ar']),
        id: asT<int?>(jsonRes['id']),
        index: asT<int?>(jsonRes['index']),
        name: asT<String?>(jsonRes['name']),
        nameAr: asT<String?>(jsonRes['name_ar']),
        settings: asT<Object?>(jsonRes['settings']),
        stepId: asT<int?>(jsonRes['stepId']),
        type: asT<String?>(jsonRes['type']),
      );

  String? description;
  String? descriptionAr;
  int? id;
  int? index;
  String? name;
  String? nameAr;
  Object? settings;
  int? stepId;
  String? type;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': description,
        'description_ar': descriptionAr,
        'id': id,
        'index': index,
        'name': name,
        'name_ar': nameAr,
        'settings': settings,
        'stepId': stepId,
        'type': type,
      };

  Options copy() {
    return Options(
      description: description,
      descriptionAr: descriptionAr,
      id: id,
      index: index,
      name: name,
      nameAr: nameAr,
      settings: settings,
      stepId: stepId,
      type: type,
    );
  }
}
