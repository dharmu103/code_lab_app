class ReferralDetails {
  String? referralcode;
  int? referralpoints;
  String? referrallink;

  ReferralDetails({this.referralcode, this.referralpoints, this.referrallink});

  ReferralDetails.fromJson(Map<String, dynamic> json) {
    referralcode = json['referral_code'];
    referralpoints = json['referral_points'];
    referrallink = json['referral_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referral_code'] = referralcode;
    data['referral_points'] = referralpoints;
    data['referral_link'] = referrallink;
    return data;
  }
}

class Root {
  String? message;
  ReferralDetails? referraldetails;

  Root({this.message, this.referraldetails});

  Root.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    referraldetails = json['referral_details'] != null
        ? ReferralDetails?.fromJson(json['referral_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['referral_details'] = referraldetails!.toJson();
    return data;
  }
}
