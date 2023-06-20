class UserModel {
  String? message;
  Profile? profile;

  UserModel({this.message, this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? email;
  bool? emailVerified;
  Null? phoneNumber;
  Null? countryCode;
  bool? phoneNumberVerified;
  String? firstName;
  String? lastName;
  String? profileImage;

  Profile(
      {this.email,
      this.emailVerified,
      this.phoneNumber,
      this.countryCode,
      this.phoneNumberVerified,
      this.firstName,
      this.lastName,
      this.profileImage});

  Profile.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    emailVerified = json['email_verified'];
    phoneNumber = json['phone_number'];
    countryCode = json['country_code'];
    phoneNumberVerified = json['phone_number_verified'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['phone_number'] = this.phoneNumber;
    data['country_code'] = this.countryCode;
    data['phone_number_verified'] = this.phoneNumberVerified;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
