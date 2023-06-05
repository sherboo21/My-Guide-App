class ProfileDataModel {
  int? status;
  String? message;
  Data? data;

  ProfileDataModel({this.status, this.message, this.data});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? name;
  String? email;
  String? phoneNumber;
  int? age;
  String? gender;
  String? image;

  Data(
      {this.name,
      this.email,
      this.phoneNumber,
      this.age,
      this.gender,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    age = json['age'];
    gender = json['gender'];
    image = json['image'];
  }
}
