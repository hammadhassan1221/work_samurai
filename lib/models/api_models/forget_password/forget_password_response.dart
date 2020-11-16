class ForgetPasswordResponse {
  int responseCode;
  Null data;

  ForgetPasswordResponse({this.responseCode, this.data});

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['Data'] = this.data;
    return data;
  }
}