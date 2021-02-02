class EarningResponse {
  String totalEarning;
  int jobCompleted;
  String duration;
  dynamic jobs;

  EarningResponse(
      {this.duration,this.jobCompleted,this.totalEarning,this.jobs});

  EarningResponse.fromJson(Map<String, dynamic> json) {
    totalEarning = json['TotalEarnings'];
    jobCompleted= json['JobsCompleted'];
    duration = json['Duration'];
    jobs = json['Jobs'];
  }

}