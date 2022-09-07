import 'package:code_generators/base_model.dart';

class AutoGenericModel extends BaseModel<AutoGenericModel> {
  String? username;
  int? favouriteInteger;
  double? favouriteDouble;
  String? url;
  String? htmlUrl;
  List<String>? tags;
  List<int>? randomIntegers;
  List<double>? randomDoubles;
  PersonalInfo? personalInfo;

  AutoGenericModel({
    this.username,
    this.favouriteInteger,
    this.favouriteDouble,
    this.url,
    this.htmlUrl,
    this.tags,
    this.randomIntegers,
    this.randomDoubles,
    this.personalInfo,
  });

  @override
  AutoGenericModel fromJson(Map<String, dynamic> json) => AutoGenericModel(
        username: json['username'],
        favouriteInteger: json['favouriteInteger'],
        favouriteDouble: json['favouriteDouble'],
        url: json['url'],
        htmlUrl: json['html_url'],
        tags: (json['tags'] != null) ? List<String>.from(json['tags']) : null,
        randomIntegers: (json['randomIntegers'] != null) ? List<int>.from(json['randomIntegers']) : null,
        randomDoubles: (json['randomDoubles'] != null) ? List<double>.from(json['randomDoubles']) : null,
        personalInfo: json['personalInfo'] != null ? PersonalInfo().fromJson(json['personalInfo']) : null,
      );

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    (username != null) ? data['username'] = username : null;
    (favouriteInteger != null) ? data['favouriteInteger'] = favouriteInteger : null;
    (favouriteDouble != null) ? data['favouriteDouble'] = favouriteDouble : null;
    (url != null) ? data['url'] = url : null;
    (htmlUrl != null) ? data['html_url'] = htmlUrl : null;
    (tags != null) ? data['tags'] = tags : null;
    (randomIntegers != null) ? data['randomIntegers'] = randomIntegers : null;
    (randomDoubles != null) ? data['randomDoubles'] = randomDoubles : null;
    (personalInfo != null) ? data['personalInfo'] = personalInfo!.toJson() : null;

    return data;
  }

  AutoGenericModel copyWith({
    String? username,
    int? favouriteInteger,
    double? favouriteDouble,
    String? url,
    String? htmlUrl,
    List<String>? tags,
    List<int>? randomIntegers,
    List<double>? randomDoubles,
    PersonalInfo? personalInfo,
  }) =>
      AutoGenericModel(
        username: username ?? this.username,
        favouriteInteger: favouriteInteger ?? this.favouriteInteger,
        favouriteDouble: favouriteDouble ?? this.favouriteDouble,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        tags: tags ?? this.tags,
        randomIntegers: randomIntegers ?? this.randomIntegers,
        randomDoubles: randomDoubles ?? this.randomDoubles,
        personalInfo: personalInfo ?? this.personalInfo,
      );
}

class PersonalInfo extends BaseModel<PersonalInfo> {
  String? firstName;
  String? lastName;
  String? location;
  List<Phones>? phones;

  PersonalInfo({
    this.firstName,
    this.lastName,
    this.location,
    this.phones,
  });

  @override
  PersonalInfo fromJson(Map<String, dynamic> json) => PersonalInfo(
        firstName: json['firstName'],
        lastName: json['lastName'],
        location: json['location'],
        phones: json['phones'] != null ? List<Phones>.from(json['phones'].map((x) => Phones().fromJson(x))) : null,
      );

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    (firstName != null) ? data['firstName'] = firstName : null;
    (lastName != null) ? data['lastName'] = lastName : null;
    (location != null) ? data['location'] = location : null;
    (data['phones'] != null) ? data['phones'] = phones!.map((v) => v.toJson()).toList() : null;

    return data;
  }

  PersonalInfo copyWith({
    String? firstName,
    String? lastName,
    String? location,
    List<Phones>? phones,
  }) =>
      PersonalInfo(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        location: location ?? this.location,
        phones: phones ?? this.phones,
      );
}

class Phones extends BaseModel<Phones> {
  String? type;
  String? number;
  bool? shouldCall;

  Phones({
    this.type,
    this.number,
    this.shouldCall,
  });

  @override
  Phones fromJson(Map<String, dynamic> json) => Phones(
        type: json['type'],
        number: json['number'],
        shouldCall: json['shouldCall'],
      );

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    (type != null) ? data['type'] = type : null;
    (number != null) ? data['number'] = number : null;
    (shouldCall != null) ? data['shouldCall'] = shouldCall : null;
    return data;
  }

  Phones copyWith({
    String? type,
    String? number,
    bool? shouldCall,
  }) =>
      Phones(
        type: type ?? this.type,
        number: number ?? this.number,
        shouldCall: shouldCall ?? this.shouldCall,
      );
}
