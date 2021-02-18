/// ResponseCode : 1
/// Data : {"User":{"ID":4089,"CompanyID":null,"EmailAddress":"hammadhassan@jinnbyte.com","Password":null,"Firstname":"Ali","Lastname":"Rameez","Salutation":"Mr.","ProfessionalTitle":"","DOB":"20/11/1995","VerifiedDate":"08/01/2021","PlaceOfBirth":"Rameez","Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":"hello world","TNCAccepted":true,"Mobile":"012948371","SkillID":0,"IsActive":true,"UniqueID":"a419cac8-a587-4cb8-b031-c17e80b7c0b9","Document":{"ID":1064,"Name":"image_picker1814023004187135717","Description":null,"Type":1,"FileExtension":".jpg","FileSize":75,"UniqueID":"daeef100-1b74-4400-843a-eb87c66386b5","Attachment":null,"URL":"https://dev-system.worksamurai.com.au//Document/Load/daeef100-1b74-4400-843a-eb87c66386b5"},"CompanyDetails":null},"UserAddress":{"ID":3020,"AddressLine":"24 browning road","City":"Boronia","State":"VIC","Postcode":3155,"Country":"AUS","GPSLat":-37.8572235,"GPSLong":145.2700722}}

class UserProfileDataModel {
  int responseCode;
  Data data;

  UserProfileDataModel({
      this.responseCode, 
      this.data});

  UserProfileDataModel.fromJson(dynamic json) {
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

/// User : {"ID":4089,"CompanyID":null,"EmailAddress":"hammadhassan@jinnbyte.com","Password":null,"Firstname":"Ali","Lastname":"Rameez","Salutation":"Mr.","ProfessionalTitle":"","DOB":"20/11/1995","VerifiedDate":"08/01/2021","PlaceOfBirth":"Rameez","Gender":0,"EmailVerified":true,"PhoneVerified":true,"Description":"hello world","TNCAccepted":true,"Mobile":"012948371","SkillID":0,"IsActive":true,"UniqueID":"a419cac8-a587-4cb8-b031-c17e80b7c0b9","Document":{"ID":1064,"Name":"image_picker1814023004187135717","Description":null,"Type":1,"FileExtension":".jpg","FileSize":75,"UniqueID":"daeef100-1b74-4400-843a-eb87c66386b5","Attachment":null,"URL":"https://dev-system.worksamurai.com.au//Document/Load/daeef100-1b74-4400-843a-eb87c66386b5"},"CompanyDetails":null}
/// UserAddress : {"ID":3020,"AddressLine":"24 browning road","City":"Boronia","State":"VIC","Postcode":3155,"Country":"AUS","GPSLat":-37.8572235,"GPSLong":145.2700722}

class Data {
  User user;
  UserAddress userAddress;

  Data({
      this.user, 
      this.userAddress});

  Data.fromJson(dynamic json) {
    user = json["User"] != null ? User.fromJson(json["User"]) : null;
    userAddress = json["UserAddress"] != null ? UserAddress.fromJson(json["UserAddress"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (user != null) {
      map["User"] = user.toJson();
    }
    if (userAddress != null) {
      map["UserAddress"] = userAddress.toJson();
    }
    return map;
  }

}

/// ID : 3020
/// AddressLine : "24 browning road"
/// City : "Boronia"
/// State : "VIC"
/// Postcode : 3155
/// Country : "AUS"
/// GPSLat : -37.8572235
/// GPSLong : 145.2700722

class UserAddress {
  int id;
  String addressLine;
  String city;
  String state;
  int postcode;
  String country;
  double gPSLat;
  double gPSLong;

  UserAddress({
      this.id, 
      this.addressLine, 
      this.city, 
      this.state, 
      this.postcode, 
      this.country, 
      this.gPSLat, 
      this.gPSLong});

  UserAddress.fromJson(dynamic json) {
    id = json["ID"];
    addressLine = json["AddressLine"];
    city = json["City"];
    state = json["State"];
    postcode = json["Postcode"];
    country = json["Country"];
    gPSLat = json["GPSLat"];
    gPSLong = json["GPSLong"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["AddressLine"] = addressLine;
    map["City"] = city;
    map["State"] = state;
    map["Postcode"] = postcode;
    map["Country"] = country;
    map["GPSLat"] = gPSLat;
    map["GPSLong"] = gPSLong;
    return map;
  }

}

/// ID : 4089
/// CompanyID : null
/// EmailAddress : "hammadhassan@jinnbyte.com"
/// Password : null
/// Firstname : "Ali"
/// Lastname : "Rameez"
/// Salutation : "Mr."
/// ProfessionalTitle : ""
/// DOB : "20/11/1995"
/// VerifiedDate : "08/01/2021"
/// PlaceOfBirth : "Rameez"
/// Gender : 0
/// EmailVerified : true
/// PhoneVerified : true
/// Description : "hello world"
/// TNCAccepted : true
/// Mobile : "012948371"
/// SkillID : 0
/// IsActive : true
/// UniqueID : "a419cac8-a587-4cb8-b031-c17e80b7c0b9"
/// Document : {"ID":1064,"Name":"image_picker1814023004187135717","Description":null,"Type":1,"FileExtension":".jpg","FileSize":75,"UniqueID":"daeef100-1b74-4400-843a-eb87c66386b5","Attachment":null,"URL":"https://dev-system.worksamurai.com.au//Document/Load/daeef100-1b74-4400-843a-eb87c66386b5"}
/// CompanyDetails : null

class User {
  int id;
  dynamic companyID;
  String emailAddress;
  dynamic password;
  String firstname;
  String lastname;
  String salutation;
  String professionalTitle;
  String dob;
  String verifiedDate;
  String placeOfBirth;
  int gender;
  bool emailVerified;
  bool phoneVerified;
  String description;
  bool tNCAccepted;
  String mobile;
  int skillID;
  bool isActive;
  String uniqueID;
  Document document;
  dynamic companyDetails;

  User({
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

  User.fromJson(dynamic json) {
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
    document = json["Document"] != null ? Document.fromJson(json["Document"]) : null;
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
    if (document != null) {
      map["Document"] = document.toJson();
    }
    map["CompanyDetails"] = companyDetails;
    return map;
  }

}

/// ID : 1064
/// Name : "image_picker1814023004187135717"
/// Description : null
/// Type : 1
/// FileExtension : ".jpg"
/// FileSize : 75
/// UniqueID : "daeef100-1b74-4400-843a-eb87c66386b5"
/// Attachment : null
/// URL : "https://dev-system.worksamurai.com.au//Document/Load/daeef100-1b74-4400-843a-eb87c66386b5"

class Document {
  int id;
  String name;
  dynamic description;
  int type;
  String fileExtension;
  int fileSize;
  String uniqueID;
  dynamic attachment;
  String url;

  Document({
      this.id, 
      this.name, 
      this.description, 
      this.type, 
      this.fileExtension, 
      this.fileSize, 
      this.uniqueID, 
      this.attachment, 
      this.url});

  Document.fromJson(dynamic json) {
    id = json["ID"];
    name = json["Name"];
    description = json["Description"];
    type = json["Type"];
    fileExtension = json["FileExtension"];
    fileSize = json["FileSize"];
    uniqueID = json["UniqueID"];
    attachment = json["Attachment"];
    url = json["URL"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["Name"] = name;
    map["Description"] = description;
    map["Type"] = type;
    map["FileExtension"] = fileExtension;
    map["FileSize"] = fileSize;
    map["UniqueID"] = uniqueID;
    map["Attachment"] = attachment;
    map["URL"] = url;
    return map;
  }

}