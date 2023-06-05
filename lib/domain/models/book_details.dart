class BookDetailsDataModel {
  int? status;
  String? message;
  Data? data;

  BookDetailsDataModel({this.status, this.message, this.data});

  BookDetailsDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? img;
  String? name;
  String? author;
  String? publishYear;
  String? audioFile;

  Data(
      {this.id,
      this.img,
      this.name,
      this.author,
      this.publishYear,
      this.audioFile});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    author = json['author'];
    publishYear = json['publish_year'];
    audioFile = json['audio_file'];
  }
}
