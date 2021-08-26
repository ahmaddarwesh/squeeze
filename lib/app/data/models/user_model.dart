import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class User {
  User({
    this.createdAt,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.loginConfirmedAt,
    this.phoneNumber,
    this.points,
    this.role,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> jsonRes) => User(
        createdAt: asT<String?>(jsonRes['createdAt']),
        email: asT<String?>(jsonRes['email']),
        firstName: asT<String?>(jsonRes['firstName']),
        id: asT<String?>(jsonRes['id']),
        lastName: asT<String?>(jsonRes['lastName']),
        loginConfirmedAt: asT<String?>(jsonRes['loginConfirmedAt']),
        phoneNumber: asT<String?>(jsonRes['phoneNumber']),
        points: asT<int?>(jsonRes['points']),
        role: asT<String?>(jsonRes['role']),
        updatedAt: asT<String?>(jsonRes['updatedAt']),
      );

  String? createdAt;
  String? email;
  String? firstName;
  String? id;
  String? lastName;
  String? loginConfirmedAt;
  String? phoneNumber;
  int? points;
  String? role;
  String? updatedAt;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'email': email,
        'firstName': firstName,
        'id': id,
        'lastName': lastName,
        'loginConfirmedAt': loginConfirmedAt,
        'phoneNumber': phoneNumber,
        'points': points,
        'role': role,
        'updatedAt': updatedAt,
      };

  User copy() {
    return User(
      createdAt: createdAt,
      email: email,
      firstName: firstName,
      id: id,
      lastName: lastName,
      loginConfirmedAt: loginConfirmedAt,
      phoneNumber: phoneNumber,
      points: points,
      role: role,
      updatedAt: updatedAt,
    );
  }
}
