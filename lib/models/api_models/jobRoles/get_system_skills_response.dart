/// ResponseCode : 1
/// Data : {"SystemSkills":[{"ID":1,"Name":"IT","Description":null,"Childrens":[{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png","MinimumWage":20.00},{"ID":8,"ParentSkillID":1,"Name":"Dev Ops Engineer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Dashboard-64.png","MinimumWage":50.00},{"ID":11,"ParentSkillID":1,"Name":"SOC Analyst","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Survey-64.png","MinimumWage":5.00}]},{"ID":9,"Name":"Hospitality","Description":null,"Childrens":[{"ID":10,"ParentSkillID":9,"Name":"Housekeeper","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn3.iconfinder.com/data/icons/occupation-19/512/housekeeper-occupation-job-profession-64.png","MinimumWage":20.00},{"ID":12,"ParentSkillID":9,"Name":"Waiter","Description":"sadas","IsActive":true,"VerificationRequired":true,"Icon":"https://cdn2.iconfinder.com/data/icons/hotel-service-32/32/bellhop_hotel_baggage_service_waiter-64.png","MinimumWage":10.00}]}]}

class GetSystemSkillsResponse {
  int responseCode;
  Data data;

  GetSystemSkillsResponse({
      this.responseCode, 
      this.data});

  GetSystemSkillsResponse.fromJson(dynamic json) {
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

/// SystemSkills : [{"ID":1,"Name":"IT","Description":null,"Childrens":[{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png","MinimumWage":20.00},{"ID":8,"ParentSkillID":1,"Name":"Dev Ops Engineer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Dashboard-64.png","MinimumWage":50.00},{"ID":11,"ParentSkillID":1,"Name":"SOC Analyst","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Survey-64.png","MinimumWage":5.00}]},{"ID":9,"Name":"Hospitality","Description":null,"Childrens":[{"ID":10,"ParentSkillID":9,"Name":"Housekeeper","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn3.iconfinder.com/data/icons/occupation-19/512/housekeeper-occupation-job-profession-64.png","MinimumWage":20.00},{"ID":12,"ParentSkillID":9,"Name":"Waiter","Description":"sadas","IsActive":true,"VerificationRequired":true,"Icon":"https://cdn2.iconfinder.com/data/icons/hotel-service-32/32/bellhop_hotel_baggage_service_waiter-64.png","MinimumWage":10.00}]}]

class Data {
  List<SystemSkills> systemSkills;

  Data({
      this.systemSkills});

  Data.fromJson(dynamic json) {
    if (json["SystemSkills"] != null) {
      systemSkills = [];
      json["SystemSkills"].forEach((v) {
        systemSkills.add(SystemSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (systemSkills != null) {
      map["SystemSkills"] = systemSkills.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 1
/// Name : "IT"
/// Description : null
/// Childrens : [{"ID":3,"ParentSkillID":1,"Name":"Developer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Development-64.png","MinimumWage":20.00},{"ID":8,"ParentSkillID":1,"Name":"Dev Ops Engineer","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Dashboard-64.png","MinimumWage":50.00},{"ID":11,"ParentSkillID":1,"Name":"SOC Analyst","Description":null,"IsActive":true,"VerificationRequired":true,"Icon":"https://cdn4.iconfinder.com/data/icons/computer-and-web-2/500/Survey-64.png","MinimumWage":5.00}]

class SystemSkills {
  int id;
  String name;
  dynamic description;
  List<Childrens> childrens;

  SystemSkills({
      this.id, 
      this.name, 
      this.description, 
      this.childrens});

  SystemSkills.fromJson(dynamic json) {
    id = json["ID"];
    name = json["Name"];
    description = json["Description"];
    if (json["Childrens"] != null) {
      childrens = [];
      json["Childrens"].forEach((v) {
        childrens.add(Childrens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["Name"] = name;
    map["Description"] = description;
    if (childrens != null) {
      map["Childrens"] = childrens.map((v) => v.toJson()).toList();
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

class Childrens {
  int id;
  int parentSkillID;
  String name;
  dynamic description;
  bool isActive;
  bool verificationRequired;
  String icon;
  double minimumWage;

  Childrens({
      this.id, 
      this.parentSkillID, 
      this.name, 
      this.description, 
      this.isActive, 
      this.verificationRequired, 
      this.icon, 
      this.minimumWage});

  Childrens.fromJson(dynamic json) {
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