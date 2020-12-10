/// ResponseCode : 1
/// Data : {"Skills":[{"ID":1,"Name":"IT","Description":"","Childrens":[{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":"","IsActive":true,"VerificationRequired":true,"Icon":"","MinimumWage":20.00,"CoverPhoto":""}]}]}

class GetAppData {
  int _responseCode;
  Data _data;

  int get responseCode => _responseCode;
  Data get data => _data;

  GetAppData.empty();

  GetAppData.fromJson(dynamic json) {
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

/// Skills : [{"ID":1,"Name":"IT","Description":"","Childrens":[{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":"","IsActive":true,"VerificationRequired":true,"Icon":"","MinimumWage":20.00,"CoverPhoto":""}]}]

class Data {
  List<Skills> _skills;

  List<Skills> get skills => _skills;

  Data({
      List<Skills> skills}){
    _skills = skills;
}

  Data.fromJson(dynamic json) {
    if (json["Skills"] != null) {
      _skills = [];
      json["Skills"].forEach((v) {
        _skills.add(Skills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_skills != null) {
      map["Skills"] = _skills.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 1
/// Name : "IT"
/// Description : ""
/// Childrens : [{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":"","IsActive":true,"VerificationRequired":true,"Icon":"","MinimumWage":20.00,"CoverPhoto":""}]

class Skills {
  int _id;
  String _name;
  String _description;
  List<Childrens> _childrens;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  List<Childrens> get childrens => _childrens;

  Skills({
      int id, 
      String name, 
      String description, 
      List<Childrens> childrens}){
    _id = id;
    _name = name;
    _description = description;
    _childrens = childrens;
}

  Skills.fromJson(dynamic json) {
    _id = json["ID"];
    _name = json["Name"];
    _description = json["Description"];
    if (json["Childrens"] != null) {
      _childrens = [];
      json["Childrens"].forEach((v) {
        _childrens.add(Childrens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = _id;
    map["Name"] = _name;
    map["Description"] = _description;
    if (_childrens != null) {
      map["Childrens"] = _childrens.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 3
/// ParentSkillID : 1
/// Name : "Developer"
/// Description : ""
/// IsActive : true
/// VerificationRequired : true
/// Icon : ""
/// MinimumWage : 20.00
/// CoverPhoto : ""

class Childrens {
  int _id;
  int _parentSkillID;
  String _name;
  String _description;
  bool _isActive;
  bool _verificationRequired;
  String _icon;
  double _minimumWage;
  String _coverPhoto;

  int get id => _id;
  int get parentSkillID => _parentSkillID;
  String get name => _name;
  String get description => _description;
  bool get isActive => _isActive;
  bool get verificationRequired => _verificationRequired;
  String get icon => _icon;
  double get minimumWage => _minimumWage;
  String get coverPhoto => _coverPhoto;

  Childrens({
      int id, 
      int parentSkillID, 
      String name, 
      String description, 
      bool isActive, 
      bool verificationRequired, 
      String icon, 
      double minimumWage, 
      String coverPhoto}){
    _id = id;
    _parentSkillID = parentSkillID;
    _name = name;
    _description = description;
    _isActive = isActive;
    _verificationRequired = verificationRequired;
    _icon = icon;
    _minimumWage = minimumWage;
    _coverPhoto = coverPhoto;
}

  Childrens.fromJson(dynamic json) {
    _id = json["ID"];
    _parentSkillID = json["ParentSkillID"];
    _name = json["Name"];
    _description = json["Description"];
    _isActive = json["IsActive"];
    _verificationRequired = json["VerificationRequired"];
    _icon = json["Icon"];
    _minimumWage = json["MinimumWage"];
    _coverPhoto = json["CoverPhoto"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = _id;
    map["ParentSkillID"] = _parentSkillID;
    map["Name"] = _name;
    map["Description"] = _description;
    map["IsActive"] = _isActive;
    map["VerificationRequired"] = _verificationRequired;
    map["Icon"] = _icon;
    map["MinimumWage"] = _minimumWage;
    map["CoverPhoto"] = _coverPhoto;
    return map;
  }

}