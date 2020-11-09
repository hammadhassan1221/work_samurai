
class FutureJobsResponse {
  int responseCode;
  List<Data> data;

  FutureJobsResponse({this.responseCode, this.data});

  FutureJobsResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int iD;
  String name;
  String description;
  double rate;
  double estimatedDuration;
  String startDate;
  String completedDate;
  int jobStatus;
  bool isInstant;
  bool autoAssign;

  Data(
      {this.iD,
        this.name,
        this.description,
        this.rate,
        this.estimatedDuration,
        this.startDate,
        this.completedDate,
        this.jobStatus,
        this.isInstant,
        this.autoAssign});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    description = json['Description'];
    rate = json['Rate'];
    estimatedDuration = json['EstimatedDuration'];
    startDate = json['StartDate'];
    completedDate = json['CompletedDate'];
    jobStatus = json['JobStatus'];
    isInstant = json['IsInstant'];
    autoAssign = json['AutoAssign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Rate'] = this.rate;
    data['EstimatedDuration'] = this.estimatedDuration;
    data['StartDate'] = this.startDate;
    data['CompletedDate'] = this.completedDate;
    data['JobStatus'] = this.jobStatus;
    data['IsInstant'] = this.isInstant;
    data['AutoAssign'] = this.autoAssign;
    return data;
  }
}