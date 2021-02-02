/// ResponseCode : 1
/// Data : {"SystemUsers":[{"ID":4089,"CompanyID":null,"EmailAddress":"hammadhassan@jinnbyte.com","Password":null,"Firstname":"App","Lastname":"Team","Salutation":null,"ProfessionalTitle":null,"DOB":null,"VerifiedDate":"08/01/2021","PlaceOfBirth":null,"Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":null,"TNCAccepted":true,"Mobile":"0435525519","SkillID":0,"IsActive":true,"UniqueID":"a419cac8-a587-4cb8-b031-c17e80b7c0b9","Document":null,"CompanyDetails":null},{"ID":4091,"CompanyID":null,"EmailAddress":"zubair@worksamurai.com","Password":null,"Firstname":"zubair","Lastname":"ahmed","Salutation":null,"ProfessionalTitle":null,"DOB":null,"VerifiedDate":"08/01/2021","PlaceOfBirth":null,"Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":null,"TNCAccepted":true,"Mobile":"0435525519","SkillID":0,"IsActive":true,"UniqueID":"96526aef-26f2-46a8-a0f4-d1b8d8f36829","Document":null,"CompanyDetails":null},{"ID":4090,"CompanyID":null,"EmailAddress":"hello@creatifstack.com","Password":null,"Firstname":"Saad","Lastname":"bhutto","Salutation":null,"ProfessionalTitle":null,"DOB":null,"VerifiedDate":"08/01/2021","PlaceOfBirth":null,"Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":null,"TNCAccepted":true,"Mobile":"0433155144","SkillID":0,"IsActive":true,"UniqueID":"48247292-593d-4d44-9b0e-028c3384b79e","Document":null,"CompanyDetails":null}],"Messages":[{"ID":12,"JobID":1021,"UserID":4089,"Body":"Hello there......","CreatedDate":"09/01/2021 05:02 PM","Document":null},{"ID":13,"JobID":1021,"UserID":4089,"Body":"Sending message as hammad","CreatedDate":"09/01/2021 06:42 PM","Document":null},{"ID":14,"JobID":1021,"UserID":4090,"Body":"sending message as hello@creatifstack.com","CreatedDate":"09/01/2021 06:45 PM","Document":null},{"ID":15,"JobID":1021,"UserID":4090,"Body":"attaching image in a mesage","CreatedDate":"09/01/2021 06:46 PM","Document":{"ID":0,"Name":null,"Description":null,"Type":0,"FileExtension":null,"FileSize":null,"UniqueID":"00000000-0000-0000-0000-000000000000","Attachment":null,"URL":"https://worksamurai.s3.ap-southeast-2.amazonaws.com/Test/User%20Message/15.jpg?X-Amz-Expires=41400&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA56CEJ2SPF3XE3MII/20210112/ap-southeast-2/s3/aws4_request&X-Amz-Date=20210112T151227Z&X-Amz-SignedHeaders=host&X-Amz-Signature=51dd10ca82ac1e7eb69f42a36329d8daf2641e0e52a2ba1697ccf251b81c0855"}},{"ID":16,"JobID":1021,"UserID":4090,"Body":"testing another message without any attachment....","CreatedDate":"09/01/2021 06:47 PM","Document":null},{"ID":17,"JobID":1021,"UserID":4090,"Body":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum","CreatedDate":"09/01/2021 06:47 PM","Document":null},{"ID":18,"JobID":1021,"UserID":4090,"Body":"dummy text message which has a max limit of 1024","CreatedDate":"09/01/2021 06:48 PM","Document":null},{"ID":19,"JobID":1021,"UserID":4091,"Body":"sending message as zubair@worksamurai.com ","CreatedDate":"09/01/2021 06:52 PM","Document":null},{"ID":20,"JobID":1021,"UserID":4091,"Body":"testing another message from Zubair","CreatedDate":"09/01/2021 06:52 PM","Document":null}]}

class GetAllMessagesofUserJobModel {
  int responseCode;
  Data data;

  GetAllMessagesofUserJobModel({
      this.responseCode, 
      this.data});

  GetAllMessagesofUserJobModel.fromJson(dynamic json) {
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

/// SystemUsers : [{"ID":4089,"CompanyID":null,"EmailAddress":"hammadhassan@jinnbyte.com","Password":null,"Firstname":"App","Lastname":"Team","Salutation":null,"ProfessionalTitle":null,"DOB":null,"VerifiedDate":"08/01/2021","PlaceOfBirth":null,"Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":null,"TNCAccepted":true,"Mobile":"0435525519","SkillID":0,"IsActive":true,"UniqueID":"a419cac8-a587-4cb8-b031-c17e80b7c0b9","Document":null,"CompanyDetails":null},{"ID":4091,"CompanyID":null,"EmailAddress":"zubair@worksamurai.com","Password":null,"Firstname":"zubair","Lastname":"ahmed","Salutation":null,"ProfessionalTitle":null,"DOB":null,"VerifiedDate":"08/01/2021","PlaceOfBirth":null,"Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":null,"TNCAccepted":true,"Mobile":"0435525519","SkillID":0,"IsActive":true,"UniqueID":"96526aef-26f2-46a8-a0f4-d1b8d8f36829","Document":null,"CompanyDetails":null},{"ID":4090,"CompanyID":null,"EmailAddress":"hello@creatifstack.com","Password":null,"Firstname":"Saad","Lastname":"bhutto","Salutation":null,"ProfessionalTitle":null,"DOB":null,"VerifiedDate":"08/01/2021","PlaceOfBirth":null,"Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":null,"TNCAccepted":true,"Mobile":"0433155144","SkillID":0,"IsActive":true,"UniqueID":"48247292-593d-4d44-9b0e-028c3384b79e","Document":null,"CompanyDetails":null}]
/// Messages : [{"ID":12,"JobID":1021,"UserID":4089,"Body":"Hello there......","CreatedDate":"09/01/2021 05:02 PM","Document":null},{"ID":13,"JobID":1021,"UserID":4089,"Body":"Sending message as hammad","CreatedDate":"09/01/2021 06:42 PM","Document":null},{"ID":14,"JobID":1021,"UserID":4090,"Body":"sending message as hello@creatifstack.com","CreatedDate":"09/01/2021 06:45 PM","Document":null},{"ID":15,"JobID":1021,"UserID":4090,"Body":"attaching image in a mesage","CreatedDate":"09/01/2021 06:46 PM","Document":{"ID":0,"Name":null,"Description":null,"Type":0,"FileExtension":null,"FileSize":null,"UniqueID":"00000000-0000-0000-0000-000000000000","Attachment":null,"URL":"https://worksamurai.s3.ap-southeast-2.amazonaws.com/Test/User%20Message/15.jpg?X-Amz-Expires=41400&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA56CEJ2SPF3XE3MII/20210112/ap-southeast-2/s3/aws4_request&X-Amz-Date=20210112T151227Z&X-Amz-SignedHeaders=host&X-Amz-Signature=51dd10ca82ac1e7eb69f42a36329d8daf2641e0e52a2ba1697ccf251b81c0855"}},{"ID":16,"JobID":1021,"UserID":4090,"Body":"testing another message without any attachment....","CreatedDate":"09/01/2021 06:47 PM","Document":null},{"ID":17,"JobID":1021,"UserID":4090,"Body":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum","CreatedDate":"09/01/2021 06:47 PM","Document":null},{"ID":18,"JobID":1021,"UserID":4090,"Body":"dummy text message which has a max limit of 1024","CreatedDate":"09/01/2021 06:48 PM","Document":null},{"ID":19,"JobID":1021,"UserID":4091,"Body":"sending message as zubair@worksamurai.com ","CreatedDate":"09/01/2021 06:52 PM","Document":null},{"ID":20,"JobID":1021,"UserID":4091,"Body":"testing another message from Zubair","CreatedDate":"09/01/2021 06:52 PM","Document":null}]

class Data {
  List<SystemUsers> systemUsers;
  List<Messages> messages;

  Data({
      this.systemUsers, 
      this.messages});

  Data.fromJson(dynamic json) {
    if (json["SystemUsers"] != null) {
      systemUsers = [];
      json["SystemUsers"].forEach((v) {
        systemUsers.add(SystemUsers.fromJson(v));
      });
    }
    if (json["Messages"] != null) {
      messages = [];
      json["Messages"].forEach((v) {
        messages.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (systemUsers != null) {
      map["SystemUsers"] = systemUsers.map((v) => v.toJson()).toList();
    }
    if (messages != null) {
      map["Messages"] = messages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 12
/// JobID : 1021
/// UserID : 4089
/// Body : "Hello there......"
/// CreatedDate : "09/01/2021 05:02 PM"
/// Document : null

class Messages {
  int id;
  int jobID;
  int userID;
  String body;
  String createdDate;
  dynamic document;

  Messages({
      this.id, 
      this.jobID, 
      this.userID, 
      this.body, 
      this.createdDate, 
      this.document});

  Messages.fromJson(dynamic json) {
    id = json["ID"];
    jobID = json["JobID"];
    userID = json["UserID"];
    body = json["Body"];
    createdDate = json["CreatedDate"];
    document = json["Document"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["JobID"] = jobID;
    map["UserID"] = userID;
    map["Body"] = body;
    map["CreatedDate"] = createdDate;
    map["Document"] = document;
    return map;
  }

}

/// ID : 4089
/// CompanyID : null
/// EmailAddress : "hammadhassan@jinnbyte.com"
/// Password : null
/// Firstname : "App"
/// Lastname : "Team"
/// Salutation : null
/// ProfessionalTitle : null
/// DOB : null
/// VerifiedDate : "08/01/2021"
/// PlaceOfBirth : null
/// Gender : 0
/// EmailVerified : true
/// PhoneVerified : true
/// Description : null
/// TNCAccepted : true
/// Mobile : "0435525519"
/// SkillID : 0
/// IsActive : true
/// UniqueID : "a419cac8-a587-4cb8-b031-c17e80b7c0b9"
/// Document : null
/// CompanyDetails : null

class SystemUsers {
  int id;
  dynamic companyID;
  String emailAddress;
  dynamic password;
  String firstname;
  String lastname;
  dynamic salutation;
  dynamic professionalTitle;
  dynamic dob;
  String verifiedDate;
  dynamic placeOfBirth;
  int gender;
  bool emailVerified;
  bool phoneVerified;
  dynamic description;
  bool tNCAccepted;
  String mobile;
  int skillID;
  bool isActive;
  String uniqueID;
  dynamic document;
  dynamic companyDetails;

  SystemUsers({
      this.id, 
      this.companyID, 
      this.emailAddress, 
      this.password, 
      this.firstname, 
      this.lastname, 
      this.salutation, 
      this.professionalTitle, 
      this.dob, 
      this.verifiedDate, 
      this.placeOfBirth, 
      this.gender, 
      this.emailVerified, 
      this.phoneVerified, 
      this.description, 
      this.tNCAccepted, 
      this.mobile, 
      this.skillID, 
      this.isActive, 
      this.uniqueID, 
      this.document, 
      this.companyDetails});

  SystemUsers.fromJson(dynamic json) {
    id = json["ID"];
    companyID = json["CompanyID"];
    emailAddress = json["EmailAddress"];
    password = json["Password"];
    firstname = json["Firstname"];
    lastname = json["Lastname"];
    salutation = json["Salutation"];
    professionalTitle = json["ProfessionalTitle"];
    dob = json["DOB"];
    verifiedDate = json["VerifiedDate"];
    placeOfBirth = json["PlaceOfBirth"];
    gender = json["Gender"];
    emailVerified = json["EmailVerified"];
    phoneVerified = json["PhoneVerified"];
    description = json["Description"];
    tNCAccepted = json["TNCAccepted"];
    mobile = json["Mobile"];
    skillID = json["SkillID"];
    isActive = json["IsActive"];
    uniqueID = json["UniqueID"];
    document = json["Document"];
    companyDetails = json["CompanyDetails"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["CompanyID"] = companyID;
    map["EmailAddress"] = emailAddress;
    map["Password"] = password;
    map["Firstname"] = firstname;
    map["Lastname"] = lastname;
    map["Salutation"] = salutation;
    map["ProfessionalTitle"] = professionalTitle;
    map["DOB"] = dob;
    map["VerifiedDate"] = verifiedDate;
    map["PlaceOfBirth"] = placeOfBirth;
    map["Gender"] = gender;
    map["EmailVerified"] = emailVerified;
    map["PhoneVerified"] = phoneVerified;
    map["Description"] = description;
    map["TNCAccepted"] = tNCAccepted;
    map["Mobile"] = mobile;
    map["SkillID"] = skillID;
    map["IsActive"] = isActive;
    map["UniqueID"] = uniqueID;
    map["Document"] = document;
    map["CompanyDetails"] = companyDetails;
    return map;
  }

}