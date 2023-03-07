class HotelResponse {
  int? _status;
  List<Data>? _data;

  HotelResponse.fromJson(dynamic json) {
    _status = json['status'];

    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? get data => _data;

  num? get status => _status;
}

class Data {
  int? _id;
  String? _title;
  String? _description;
  String? _address;
  String? _postcode;
  String? _phoneNumber;
  String? _latitude;
  String? _longitude;
  ImageData? _image;


  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _address = json['address'];
    _postcode = json['postcode'];
    _phoneNumber = json['phoneNumber'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _image = json['image'] != null ? ImageData.fromJson(json['image']) : null;
  }
  int? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get address => _address;

  String? get postcode => _postcode;

  String? get phoneNumber => _phoneNumber;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  ImageData? get image => _image;
}

class ImageData {
  String? _small;
  String? _medium;
  String? _large;

  ImageData.fromJson(dynamic json) {
    _small = json['small'];
    _medium = json['medium'];
    _large = json['large'];
  }

  String? get large => _large;

  String? get medium => _medium;

  String? get small => _small;
}
