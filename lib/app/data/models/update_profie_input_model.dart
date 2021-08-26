import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class UpdateProfileInput {
  UpdateProfileInput({
    this.updateUserData,
    this.updateUserWhere,
  });

  factory UpdateProfileInput.fromJson(Map<String, dynamic> jsonRes) => UpdateProfileInput(
        updateUserData: jsonRes['updateUserData'] == null
            ? null
            : UpdateUserData.fromJson(asT<Map<String, dynamic>>(jsonRes['updateUserData'])!),
        updateUserWhere: asT<Object?>(jsonRes['updateUserWhere']),
      );

  UpdateUserData? updateUserData;
  Object? updateUserWhere;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'updateUserData': updateUserData,
        'updateUserWhere': updateUserWhere,
      };

  UpdateProfileInput copy() {
    return UpdateProfileInput(
      updateUserData: updateUserData?.copy(),
      updateUserWhere: updateUserWhere,
    );
  }
}

class UpdateUserData {
  UpdateUserData({
    this.email,
    this.firstName,
    this.lastName,
  });

  factory UpdateUserData.fromJson(Map<String, dynamic> jsonRes) => UpdateUserData(
        email: jsonRes['email'] == null
            ? null
            : Email.fromJson(asT<Map<String, dynamic>>(jsonRes['email'])!),
        firstName: jsonRes['firstName'] == null
            ? null
            : FirstName.fromJson(asT<Map<String, dynamic>>(jsonRes['firstName'])!),
        lastName: jsonRes['lastName'] == null
            ? null
            : LastName.fromJson(asT<Map<String, dynamic>>(jsonRes['lastName'])!),
      );

  Email? email;
  FirstName? firstName;
  LastName? lastName;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
      };

  UpdateUserData copy() {
    return UpdateUserData(
      email: email?.copy(),
      firstName: firstName?.copy(),
      lastName: lastName?.copy(),
    );
  }
}

class Email {
  Email({
    this.set,
  });

  factory Email.fromJson(Map<String, dynamic> jsonRes) => Email(
        set: asT<String?>(jsonRes['set']),
      );

  String? set;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'set': set,
      };

  Email copy() {
    return Email(
      set: set,
    );
  }
}

class FirstName {
  FirstName({
    this.set,
  });

  factory FirstName.fromJson(Map<String, dynamic> jsonRes) => FirstName(
        set: asT<String?>(jsonRes['set']),
      );

  String? set;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'set': set,
      };

  FirstName copy() {
    return FirstName(
      set: set,
    );
  }
}

class LastName {
  LastName({
    this.set,
  });

  factory LastName.fromJson(Map<String, dynamic> jsonRes) => LastName(
        set: asT<String?>(jsonRes['set']),
      );

  String? set;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'set': set,
      };

  LastName copy() {
    return LastName(
      set: set,
    );
  }
}
