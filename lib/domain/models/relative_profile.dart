class RelativeProfileDataModel {
  int? status;
  String? message;
  Data? data;

  RelativeProfileDataModel({this.status, this.message, this.data});

  RelativeProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? type;
  String? phoneNumber;
  String? image;

  Data(
      {this.id,
        this.name,
        this.email,
        this.type,
        this.phoneNumber,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    phoneNumber = json['phone_number'];
    image = json['image'];
  }
}