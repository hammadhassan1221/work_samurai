/// ResponseCode : 1
/// Data : {"BankName":"Comm Bank","HolderName":"Testing name","BSB":"****45","AccountNumber":"****5678"}

class BankDetailResponse {
  int _responseCode;
  Data _data;

  int get responseCode => _responseCode;
  Data get data => _data;

  BankDetailResponse.empty();

  BankDetailResponse.fromJson(dynamic json) {
    _responseCode = json["ResponseCode"];
    _data = json["Data"] != null ? Data.fromJson(json["Data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = _responseCode;
    if (_data != null) {
      map["Data"] = _data.toJson();
    }
    return map;
  }

}

/// BankName : "Comm Bank"
/// HolderName : "Testing name"
/// BSB : "****45"
/// AccountNumber : "****5678"

class Data {
  String _bankName;
  String _holderName;
  String _bsb;
  String _accountNumber;


  String get bankName => _bankName;
  String get holderName => _holderName;
  String get bsb => _bsb;
  String get accountNumber => _accountNumber;

  Data({
      String bankName, 
      String holderName, 
      String bsb, 
      String accountNumber}){
    _bankName = bankName;
    _holderName = holderName;
    _bsb = bsb;
    _accountNumber = accountNumber;
}

  Data.fromJson(dynamic json) {
    _bankName = json["BankName"];
    _holderName = json["HolderName"];
    _bsb = json["BSB"];
    _accountNumber = json["AccountNumber"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["BankName"] = _bankName;
    map["HolderName"] = _holderName;
    map["BSB"] = _bsb;
    map["AccountNumber"] = _accountNumber;
    return map;
  }

}