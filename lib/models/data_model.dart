class DoctorsModel {
  DoctorsModel({
    required this.status,
    required this.message,
    required this.result,
  });
  late final bool status;
  late final String message;
  late final List<Result> result;

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Result {
  Result({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.latitude,
    required this.longtitude,
    required this.address,
    required this.ratingScore,
    required this.image,
    required this.availabilityStatus,
    required this.doctorCountry,
    required this.phoneNumber,
    required this.experience,
    required this.price,
    required this.degree,
    required this.recommended,
    required this.isFree,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String latitude;
  late final String longtitude;
  late final String address;
  late final ratingScore;
  late final String image;
  late final String availabilityStatus;
  late final String doctorCountry;
  late final String phoneNumber;
  late final String experience;
  late final String price;
  late final String degree;
  late final int recommended;
  late final int isFree;
  late final String createdAt;
  late final String? updatedAt;
  late final Null deletedAt;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    latitude = json['latitude'];
    longtitude = json['longtitude'];
    address = json['address'];
    ratingScore = json['rating_score'];
    image = json['image'];
    availabilityStatus = json['availability_status'];
    doctorCountry = json['doctor_country'];
    phoneNumber = json['phone_number'];
    experience = json['experience'];
    price = json['price'];
    degree = json['degree'];
    recommended = json['recommended'];
    isFree = json['is_free'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['latitude'] = latitude;
    _data['longtitude'] = longtitude;
    _data['address'] = address;
    _data['rating_score'] = ratingScore;
    _data['image'] = image;
    _data['availability_status'] = availabilityStatus;
    _data['doctor_country'] = doctorCountry;
    _data['phone_number'] = phoneNumber;
    _data['experience'] = experience;
    _data['price'] = price;
    _data['degree'] = degree;
    _data['recommended'] = recommended;
    _data['is_free'] = isFree;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
