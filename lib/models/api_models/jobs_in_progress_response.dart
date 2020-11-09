class JobsInProgressResponse {
  int responseCode;
  Data data;

  JobsInProgressResponse({this.responseCode, this.data});

  JobsInProgressResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int iD;
  String name;
  String description;
  int rate;
  int estimatedDuration;
  String startDate;
  Null completedDate;
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
