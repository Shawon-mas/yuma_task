// To parse this JSON data, do
//
//     final profileDataModel = profileDataModelFromJson(jsonString);

import 'dart:convert';

ProfileDataModel? profileDataModelFromJson(String str) => ProfileDataModel.fromJson(json.decode(str));

String profileDataModelToJson(ProfileDataModel? data) => json.encode(data!.toJson());

class ProfileDataModel {
  ProfileDataModel({
    this.consumerUuid,
    this.email,
    this.username,
    this.files,
    this.profile,
  });

  String? consumerUuid;
  String? email;
  String? username;
  List<dynamic>? files;
  Profile? profile;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
    consumerUuid: json["consumer_uuid"],
    email: json["email"],
    username: json["username"],
    files: List<dynamic>.from(json["files"].map((x) => x)),
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "consumer_uuid": consumerUuid,
    "email": email,
    "username": username,
    "files": List<dynamic>.from(files!.map((x) => x)),
    "profile": profile!.toJson(),
  };
}

class Profile {
  Profile({
    this.lastName,
    this.firstName,
  });

  String? lastName;
  String? firstName;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    lastName: json["last_name"],
    firstName: json["first_name"],
  );

  Map<String, dynamic> toJson() => {
    "last_name": lastName,
    "first_name": firstName,
  };
}
