class BooksDataModel {
  int? status;
  String? message;
  List<Data>? data;

  BooksDataModel({this.status, this.message, this.data});

  BooksDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
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
