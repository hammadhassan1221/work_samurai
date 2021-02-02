/// ResponseCode : 1
/// Data : {"UserSkills":[{"ID":79,"SkillID":3,"VerifiedDate":null,"ExpiryDate":null,"Document":null,"Skill":{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png","MinimumWage":20.00}}]}

class GetUserSkilllsResponse {
  int responseCode;
  Data data;

  GetUserSkilllsResponse({
      this.responseCode, 
      this.data});

  GetUserSkilllsResponse.fromJson(dynamic json) {
    responseCode = json["ResponseCode"];
    data = json["Data"] != null ? Data.fromJson(json["Data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = responseCode;
    if (data != null) {
      map["Data"] = data.toJson();
    }
    return map;
  }

}

/// UserSkills : [{"ID":79,"SkillID":3,"VerifiedDate":null,"ExpiryDate":null,"Document":null,"Skill":{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png","MinimumWage":20.00}}]

class Data {
  List<UserSkills> userSkills;

  Data({
      this.userSkills});

  Data.fromJson(dynamic json) {
    if (json["UserSkills"] != null) {
      userSkills = [];
      json["UserSkills"].forEach((v) {
        userSkills.add(UserSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (userSkills != null) {
      map["UserSkills"] = userSkills.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 79
/// SkillID : 3
/// VerifiedDate : null
/// ExpiryDate : null
/// Document : null
/// Skill : {"ID":3,"ParentSkillID":1,"Name":"Developer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png","MinimumWage":20.00}

class UserSkills {
  int id;
  int skillID;
  dynamic verifiedDate;
  dynamic expiryDate;
  dynamic document;
  Skill skill;

  UserSkills({
      this.id, 
      this.skillID, 
      this.verifiedDate, 
      this.expiryDate, 
      this.document, 
      this.skill});

  UserSkills.fromJson(dynamic json) {
    id = json["ID"];
    skillID = json["SkillID"];
    verifiedDate = json["VerifiedDate"];
    expiryDate = json["ExpiryDate"];
    document = json["Document"];
    skill = json["Skill"] != null ? Skill.fromJson(json["Skill"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["SkillID"] = skillID;
    map["VerifiedDate"] = verifiedDate;
    map["ExpiryDate"] = expiryDate;
    map["Document"] = document;
    if (skill != null) {
      map["Skill"] = skill.toJson();
    }
    return map;
  }

}

/// ID : 3
/// ParentSkillID : 1
/// Name : "Developer"
/// Description : null
/// IsActive : true
/// VerificationRequired : true
/// Icon : "https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png"
/// MinimumWage : 20.00

class Skill {
  int id;
  int parentSkillID;
  String name;
  dynamic description;
  bool isActive;
  bool verificationRequired;
  String icon;
  double minimumWage;

  Skill({
      this.id, 
      this.parentSkillID, 
      this.name, 
      this.description, 
      this.isActive, 
      this.verificationRequired, 
      this.icon, 
      this.minimumWage});

  Skill.fromJson(dynamic json) {
    id = json["ID"];
    parentSkillID = json["ParentSkillID"];
    name = json["Name"];
    description = json["Description"];
    isActive = json["IsActive"];
    verificationRequired = json["VerificationRequired"];
    icon = json["Icon"];
    minimumWage = json["MinimumWage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["ParentSkillID"] = parentSkillID;
    map["Name"] = name;
    map["Description"] = description;
    map["IsActive"] = isActive;
    map["VerificationRequired"] = verificationRequired;
    map["Icon"] = icon;
    map["MinimumWage"] = minimumWage;
    return map;
  }

}