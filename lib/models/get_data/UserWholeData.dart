// To parse this JSON data, do
//
//     final userWholeData = userWholeDataFromJson(jsonString);

import 'dart:convert';

UserWholeData userWholeDataFromJson(String str) =>
    UserWholeData.fromJson(json.decode(str));

String userWholeDataToJson(UserWholeData data) => json.encode(data.toJson());

class UserWholeData {
  UserWholeData({
    this.responseCode,
    this.data,
  });

  int responseCode;
  Data data;

  factory UserWholeData.fromJson(Map<String, dynamic> json) => UserWholeData(
        responseCode:
            json["ResponseCode"] == null ? null : json["ResponseCode"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode == null ? null : responseCode,
        "Data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.userAddress,
    this.userSkills,
    this.preferences,
    this.userSettings,
    this.userVerifications,
    this.userCompliments,
    this.userRating,
    this.completedJobs,
    this.accountVerified,
    this.supportTickets,
    this.paymentDetails,
    this.systemSkills,
    this.verificationMethods,
    this.systemCompliments,
  });

  User user;
  UserAddress userAddress;
  List<UserSkill> userSkills;
  Preferences preferences;
  List<dynamic> userSettings;
  List<dynamic> userVerifications;
  List<UserCompliment> userCompliments;
  double userRating;
  int completedJobs;
  bool accountVerified;
  List<dynamic> supportTickets;
  PaymentDetails paymentDetails;
  List<SystemSkill> systemSkills;
  List<VerificationMethod> verificationMethods;
  List<SystemCompliment> systemCompliments;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["User"] == null ? null : User.fromJson(json["User"]),
        userAddress: json["UserAddress"] == null
            ? null
            : UserAddress.fromJson(json["UserAddress"]),
        userSkills: json["UserSkills"] == null
            ? null
            : List<UserSkill>.from(
                json["UserSkills"].map((x) => UserSkill.fromJson(x))),
        preferences: json["Preferences"] == null
            ? null
            : Preferences.fromJson(json["Preferences"]),
        userSettings: json["UserSettings"] == null
            ? null
            : List<dynamic>.from(json["UserSettings"].map((x) => x)),
        userVerifications: json["UserVerifications"] == null
            ? null
            : List<dynamic>.from(json["UserVerifications"].map((x) => x)),
        userCompliments: json["UserCompliments"] == null
            ? null
            : List<UserCompliment>.from(
                json["UserCompliments"].map((x) => UserCompliment.fromJson(x))),
        userRating: json["UserRating"] == null ? null : json["UserRating"],
        completedJobs:
            json["CompletedJobs"] == null ? null : json["CompletedJobs"],
        accountVerified:
            json["AccountVerified"] == null ? null : json["AccountVerified"],
        supportTickets: json["SupportTickets"] == null
            ? null
            : List<dynamic>.from(json["SupportTickets"].map((x) => x)),
        paymentDetails: json["PaymentDetails"] == null
            ? null
            : PaymentDetails.fromJson(json["PaymentDetails"]),
        systemSkills: json["SystemSkills"] == null
            ? null
            : List<SystemSkill>.from(
                json["SystemSkills"].map((x) => SystemSkill.fromJson(x))),
        verificationMethods: json["VerificationMethods"] == null
            ? null
            : List<VerificationMethod>.from(json["VerificationMethods"]
                .map((x) => VerificationMethod.fromJson(x))),
        systemCompliments: json["SystemCompliments"] == null
            ? null
            : List<SystemCompliment>.from(json["SystemCompliments"]
                .map((x) => SystemCompliment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "User": user == null ? null : user.toJson(),
        "UserAddress": userAddress == null ? null : userAddress.toJson(),
        "UserSkills": userSkills == null
            ? null
            : List<dynamic>.from(userSkills.map((x) => x.toJson())),
        "Preferences": preferences == null ? null : preferences.toJson(),
        "UserSettings": userSettings == null
            ? null
            : List<dynamic>.from(userSettings.map((x) => x)),
        "UserVerifications": userVerifications == null
            ? null
            : List<dynamic>.from(userVerifications.map((x) => x)),
        "UserCompliments": userCompliments == null
            ? null
            : List<dynamic>.from(userCompliments.map((x) => x.toJson())),
        "UserRating": userRating == null ? null : userRating,
        "CompletedJobs": completedJobs == null ? null : completedJobs,
        "AccountVerified": accountVerified == null ? null : accountVerified,
        "SupportTickets": supportTickets == null
            ? null
            : List<dynamic>.from(supportTickets.map((x) => x)),
        "PaymentDetails":
            paymentDetails == null ? null : paymentDetails.toJson(),
        "SystemSkills": systemSkills == null
            ? null
            : List<dynamic>.from(systemSkills.map((x) => x.toJson())),
        "VerificationMethods": verificationMethods == null
            ? null
            : List<dynamic>.from(verificationMethods.map((x) => x.toJson())),
        "SystemCompliments": systemCompliments == null
            ? null
            : List<dynamic>.from(systemCompliments.map((x) => x.toJson())),
      };
}

class PaymentDetails {
  PaymentDetails({
    this.bankName,
    this.holderName,
    this.bsb,
    this.accountNumber,
  });

  dynamic bankName;
  dynamic holderName;
  dynamic bsb;
  dynamic accountNumber;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
        bankName: json["BankName"],
        holderName: json["HolderName"],
        bsb: json["BSB"],
        accountNumber: json["AccountNumber"],
      );

  Map<String, dynamic> toJson() => {
        "BankName": bankName,
        "HolderName": holderName,
        "BSB": bsb,
        "AccountNumber": accountNumber,
      };
}

class Preferences {
  Preferences({
    this.systemUserId,
    this.mondayFrom,
    this.mondayTo,
    this.tuesdayFrom,
    this.tuesdayTo,
    this.wednesdayFrom,
    this.wednesdayTo,
    this.thursdayFrom,
    this.thursdayTo,
    this.fridayFrom,
    this.fridayTo,
    this.saturdayFrom,
    this.saturdayTo,
    this.sundayFrom,
    this.sundayTo,
    this.jobRadius,
  });

  int systemUserId;
  String mondayFrom;
  String mondayTo;
  String tuesdayFrom;
  String tuesdayTo;
  String wednesdayFrom;
  String wednesdayTo;
  String thursdayFrom;
  String thursdayTo;
  String fridayFrom;
  String fridayTo;
  String saturdayFrom;
  String saturdayTo;
  String sundayFrom;
  String sundayTo;
  int jobRadius;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        systemUserId:
            json["SystemUserID"] == null ? null : json["SystemUserID"],
        mondayFrom: json["MondayFrom"] == null ? null : json["MondayFrom"],
        mondayTo: json["MondayTo"] == null ? null : json["MondayTo"],
        tuesdayFrom: json["TuesdayFrom"] == null ? null : json["TuesdayFrom"],
        tuesdayTo: json["TuesdayTo"] == null ? null : json["TuesdayTo"],
        wednesdayFrom:
            json["WednesdayFrom"] == null ? null : json["WednesdayFrom"],
        wednesdayTo: json["WednesdayTo"] == null ? null : json["WednesdayTo"],
        thursdayFrom:
            json["ThursdayFrom"] == null ? null : json["ThursdayFrom"],
        thursdayTo: json["ThursdayTo"] == null ? null : json["ThursdayTo"],
        fridayFrom: json["FridayFrom"] == null ? null : json["FridayFrom"],
        fridayTo: json["FridayTo"] == null ? null : json["FridayTo"],
        saturdayFrom:
            json["SaturdayFrom"] == null ? null : json["SaturdayFrom"],
        saturdayTo: json["SaturdayTo"] == null ? null : json["SaturdayTo"],
        sundayFrom: json["SundayFrom"] == null ? null : json["SundayFrom"],
        sundayTo: json["SundayTo"] == null ? null : json["SundayTo"],
        jobRadius: json["JobRadius"] == null ? null : json["JobRadius"],
      );

  Map<String, dynamic> toJson() => {
        "SystemUserID": systemUserId == null ? null : systemUserId,
        "MondayFrom": mondayFrom == null ? null : mondayFrom,
        "MondayTo": mondayTo == null ? null : mondayTo,
        "TuesdayFrom": tuesdayFrom == null ? null : tuesdayFrom,
        "TuesdayTo": tuesdayTo == null ? null : tuesdayTo,
        "WednesdayFrom": wednesdayFrom == null ? null : wednesdayFrom,
        "WednesdayTo": wednesdayTo == null ? null : wednesdayTo,
        "ThursdayFrom": thursdayFrom == null ? null : thursdayFrom,
        "ThursdayTo": thursdayTo == null ? null : thursdayTo,
        "FridayFrom": fridayFrom == null ? null : fridayFrom,
        "FridayTo": fridayTo == null ? null : fridayTo,
        "SaturdayFrom": saturdayFrom == null ? null : saturdayFrom,
        "SaturdayTo": saturdayTo == null ? null : saturdayTo,
        "SundayFrom": sundayFrom == null ? null : sundayFrom,
        "SundayTo": sundayTo == null ? null : sundayTo,
        "JobRadius": jobRadius == null ? null : jobRadius,
      };
}

class SystemCompliment {
  SystemCompliment({
    this.id,
    this.name,
    this.isActive,
  });

  int id;
  String name;
  bool isActive;

  factory SystemCompliment.fromJson(Map<String, dynamic> json) =>
      SystemCompliment(
        id: json["ID"] == null ? null : json["ID"],
        name: json["Name"] == null ? null : json["Name"],
        isActive: json["IsActive"] == null ? null : json["IsActive"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "Name": name == null ? null : name,
        "IsActive": isActive == null ? null : isActive,
      };
}

class SystemSkill {
  SystemSkill({
    this.id,
    this.name,
    this.description,
    this.childrens,
  });

  int id;
  String name;
  dynamic description;
  List<Skill> childrens;

  factory SystemSkill.fromJson(Map<String, dynamic> json) => SystemSkill(
        id: json["ID"] == null ? null : json["ID"],
        name: json["Name"] == null ? null : json["Name"],
        description: json["Description"],
        childrens: json["Childrens"] == null
            ? null
            : List<Skill>.from(json["Childrens"].map((x) => Skill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "Name": name == null ? null : name,
        "Description": description,
        "Childrens": childrens == null
            ? null
            : List<dynamic>.from(childrens.map((x) => x.toJson())),
      };
}

class Skill {
  Skill({
    this.id,
    this.parentSkillId,
    this.name,
    this.description,
    this.isActive,
    this.verificationRequired,
    this.icon,
    this.minimumWage,
    this.coverPhoto,
  });

  int id;
  int parentSkillId;
  String name;
  String description;
  bool isActive;
  bool verificationRequired;
  dynamic icon;
  double minimumWage;
  String coverPhoto;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["ID"] == null ? null : json["ID"],
        parentSkillId:
            json["ParentSkillID"] == null ? null : json["ParentSkillID"],
        name: json["Name"] == null ? null : json["Name"],
        description: json["Description"] == null ? null : json["Description"],
        isActive: json["IsActive"] == null ? null : json["IsActive"],
        verificationRequired: json["VerificationRequired"] == null
            ? null
            : json["VerificationRequired"],
        icon: json["Icon"],
        minimumWage: json["MinimumWage"] == null ? null : json["MinimumWage"],
        coverPhoto: json["CoverPhoto"] == null ? null : json["CoverPhoto"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "ParentSkillID": parentSkillId == null ? null : parentSkillId,
        "Name": name == null ? null : name,
        "Description": description == null ? null : description,
        "IsActive": isActive == null ? null : isActive,
        "VerificationRequired":
            verificationRequired == null ? null : verificationRequired,
        "Icon": icon,
        "MinimumWage": minimumWage == null ? null : minimumWage,
        "CoverPhoto": coverPhoto == null ? null : coverPhoto,
      };
}

class User {
  User({
    this.id,
    this.companyId,
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
    this.tncAccepted,
    this.mobile,
    this.facebook,
    this.twitter,
    this.instagram,
    this.skillId,
    this.isActive,
    this.uniqueId,
    this.document,
    this.companyDetails,
  });

  int id;
  dynamic companyId;
  String emailAddress;
  dynamic password;
  String firstname;
  String lastname;
  String salutation;
  String professionalTitle;
  dynamic dob;
  dynamic verifiedDate;
  String placeOfBirth;
  int gender;
  bool emailVerified;
  bool phoneVerified;
  String description;
  bool tncAccepted;
  String mobile;
  String facebook;
  String twitter;
  String instagram;
  int skillId;
  bool isActive;
  String uniqueId;
  dynamic document;
  dynamic companyDetails;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"] == null ? null : json["ID"],
        companyId: json["CompanyID"],
        emailAddress:
            json["EmailAddress"] == null ? null : json["EmailAddress"],
        password: json["Password"],
        firstname: json["Firstname"] == null ? null : json["Firstname"],
        lastname: json["Lastname"] == null ? null : json["Lastname"],
        salutation: json["Salutation"] == null ? null : json["Salutation"],
        professionalTitle: json["ProfessionalTitle"] == null
            ? null
            : json["ProfessionalTitle"],
        dob: json["DOB"],
        verifiedDate: json["VerifiedDate"],
        placeOfBirth:
            json["PlaceOfBirth"] == null ? null : json["PlaceOfBirth"],
        gender: json["Gender"] == null ? null : json["Gender"],
        emailVerified:
            json["EmailVerified"] == null ? null : json["EmailVerified"],
        phoneVerified:
            json["PhoneVerified"] == null ? null : json["PhoneVerified"],
        description: json["Description"] == null ? null : json["Description"],
        tncAccepted: json["TNCAccepted"] == null ? null : json["TNCAccepted"],
        mobile: json["Mobile"] == null ? null : json["Mobile"],
        facebook: json["Facebook"] == null ? null : json["Facebook"],
        twitter: json["Twitter"] == null ? null : json["Twitter"],
        instagram: json["Instagram"] == null ? null : json["Instagram"],
        skillId: json["SkillID"] == null ? null : json["SkillID"],
        isActive: json["IsActive"] == null ? null : json["IsActive"],
        uniqueId: json["UniqueID"] == null ? null : json["UniqueID"],
        document: json["Document"],
        companyDetails: json["CompanyDetails"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "CompanyID": companyId,
        "EmailAddress": emailAddress == null ? null : emailAddress,
        "Password": password,
        "Firstname": firstname == null ? null : firstname,
        "Lastname": lastname == null ? null : lastname,
        "Salutation": salutation == null ? null : salutation,
        "ProfessionalTitle":
            professionalTitle == null ? null : professionalTitle,
        "DOB": dob,
        "VerifiedDate": verifiedDate,
        "PlaceOfBirth": placeOfBirth == null ? null : placeOfBirth,
        "Gender": gender == null ? null : gender,
        "EmailVerified": emailVerified == null ? null : emailVerified,
        "PhoneVerified": phoneVerified == null ? null : phoneVerified,
        "Description": description == null ? null : description,
        "TNCAccepted": tncAccepted == null ? null : tncAccepted,
        "Mobile": mobile == null ? null : mobile,
        "Facebook": facebook == null ? null : facebook,
        "Twitter": twitter == null ? null : twitter,
        "Instagram": instagram == null ? null : instagram,
        "SkillID": skillId == null ? null : skillId,
        "IsActive": isActive == null ? null : isActive,
        "UniqueID": uniqueId == null ? null : uniqueId,
        "Document": document,
        "CompanyDetails": companyDetails,
      };
}

class UserAddress {
  UserAddress({
    this.id,
    this.addressLine,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.gpsLat,
    this.gpsLong,
  });

  int id;
  dynamic addressLine;
  dynamic city;
  dynamic state;
  dynamic postcode;
  dynamic country;
  double gpsLat;
  double gpsLong;

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        id: json["ID"] == null ? null : json["ID"],
        addressLine: json["AddressLine"],
        city: json["City"],
        state: json["State"],
        postcode: json["Postcode"],
        country: json["Country"],
        gpsLat: json["GPSLat"] == null ? null : json["GPSLat"],
        gpsLong: json["GPSLong"] == null ? null : json["GPSLong"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "AddressLine": addressLine,
        "City": city,
        "State": state,
        "Postcode": postcode,
        "Country": country,
        "GPSLat": gpsLat == null ? null : gpsLat,
        "GPSLong": gpsLong == null ? null : gpsLong,
      };
}

class UserCompliment {
  UserCompliment({
    this.name,
    this.count,
  });

  String name;
  int count;

  factory UserCompliment.fromJson(Map<String, dynamic> json) => UserCompliment(
        name: json["Name"] == null ? null : json["Name"],
        count: json["Count"] == null ? null : json["Count"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Count": count == null ? null : count,
      };
}

class UserSkill {
  UserSkill({
    this.id,
    this.skillId,
    this.verifiedDate,
    this.expiryDate,
    this.document,
    this.skill,
  });

  int id;
  int skillId;
  dynamic verifiedDate;
  dynamic expiryDate;
  dynamic document;
  Skill skill;

  factory UserSkill.fromJson(Map<String, dynamic> json) => UserSkill(
        id: json["ID"] == null ? null : json["ID"],
        skillId: json["SkillID"] == null ? null : json["SkillID"],
        verifiedDate: json["VerifiedDate"],
        expiryDate: json["ExpiryDate"],
        document: json["Document"],
        skill: json["Skill"] == null ? null : Skill.fromJson(json["Skill"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "SkillID": skillId == null ? null : skillId,
        "VerifiedDate": verifiedDate,
        "ExpiryDate": expiryDate,
        "Document": document,
        "Skill": skill == null ? null : skill.toJson(),
      };
}

class VerificationMethod {
  VerificationMethod({
    this.id,
    this.name,
    this.description,
    this.required,
    this.type,
    this.isActive,
    this.canExpire,
    this.isPoliceCheck,
  });

  int id;
  String name;
  String description;
  bool required;
  int type;
  bool isActive;
  bool canExpire;
  bool isPoliceCheck;

  factory VerificationMethod.fromJson(Map<String, dynamic> json) =>
      VerificationMethod(
        id: json["ID"] == null ? null : json["ID"],
        name: json["Name"] == null ? null : json["Name"],
        description: json["Description"] == null ? null : json["Description"],
        required: json["Required"] == null ? null : json["Required"],
        type: json["Type"] == null ? null : json["Type"],
        isActive: json["IsActive"] == null ? null : json["IsActive"],
        canExpire: json["CanExpire"] == null ? null : json["CanExpire"],
        isPoliceCheck:
            json["IsPoliceCheck"] == null ? null : json["IsPoliceCheck"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "Name": name == null ? null : name,
        "Description": description == null ? null : description,
        "Required": required == null ? null : required,
        "Type": type == null ? null : type,
        "IsActive": isActive == null ? null : isActive,
        "CanExpire": canExpire == null ? null : canExpire,
        "IsPoliceCheck": isPoliceCheck == null ? null : isPoliceCheck,
      };
}
