/// ResponseCode : 1
/// Data : [{"JobID":1021,"JobName":"Gardening","CompanyName":"ABC company  (4)","SkillName":"Developer","StartDate":"2021-01-12T13:00:00","Ratings":2,"Compliments":2}]

class GetAllUserMessages {
  int responseCode;
  List<Data> data;

  GetAllUserMessages({
      this.responseCode, 
      this.data});

  GetAllUserMessages.fromJson(dynamic json) {
    responseCode = json["ResponseCode"];
    if (json["Data"] != null) {
      data = [];
      json["Data"].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = responseCode;
    if (data != null) {
      map["Data"] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// JobID : 1021
/// JobName : "Gardening"
/// CompanyName : "ABC company  (4)"
/// SkillName : "Developer"
/// StartDate : "2021-01-12T13:00:00"
/// Ratings : 2
/// Compliments : 2

class Data {
  int jobID;
  String jobName;
  String companyName;
  String skillName;
  String startDate;
  int ratings;
  int compliments;

  Data({
      this.jobID, 
      this.jobName, 
      this.companyName, 
      this.skillName, 
      this.startDate, 
      this.ratings, 
      this.compliments});

  Data.fromJson(dynamic json) {
    jobID = json["JobID"];
    jobName = json["JobName"];
    companyName = json["CompanyName"];
    skillName = json["SkillName"];
    startDate = json["StartDate"];
    ratings = json["Ratings"];
    compliments = json["Compliments"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["JobID"] = jobID;
    map["JobName"] = jobName;
    map["CompanyName"] = companyName;
    map["SkillName"] = skillName;
    map["StartDate"] = startDate;
    map["Ratings"] = ratings;
    map["Compliments"] = compliments;
    return map;
  }

}