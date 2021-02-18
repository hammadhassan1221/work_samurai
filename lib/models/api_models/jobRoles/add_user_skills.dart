class AddUserSkillResponse {
  int responseCode;
  Data data;

  AddUserSkillResponse.empty();

  AddUserSkillResponse.fromJson(Map<String, dynamic> json) {
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
  int skillID;
  Null verifiedDate;
  Null expiryDate;
  Document document;
  Null skill;

  Data(
      {this.iD,
        this.skillID,
        this.verifiedDate,
        this.expiryDate,
        this.document,
        this.skill});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    skillID = json['SkillID'];
    verifiedDate = json['VerifiedDate'];
    expiryDate = json['ExpiryDate'];
    document = json['Document'] != null
        ? new Document.fromJson(json['Document'])
        : null;
    skill = json['Skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['SkillID'] = this.skillID;
    data['VerifiedDate'] = this.verifiedDate;
    data['ExpiryDate'] = this.expiryDate;
    if (this.document != null) {
      data['Document'] = this.document.toJson();
    }
    data['Skill'] = this.skill;
    return data;
  }
}

class Document {
  int iD;
  String name;
  String description;
  int type;
  String fileExtension;
  int fileSize;
  String uniqueID;
  Null attachment;
  String uRL;

  Document(
      {this.iD,
        this.name,
        this.description,
        this.type,
        this.fileExtension,
        this.fileSize,
        this.uniqueID,
        this.attachment,
        this.uRL});

  Document.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    description = json['Description'];
    type = json['Type'];
    fileExtension = json['FileExtension'];
    fileSize = json['FileSize'];
    uniqueID = json['UniqueID'];
    attachment = json['Attachment'];
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Type'] = this.type;
    data['FileExtension'] = this.fileExtension;
    data['FileSize'] = this.fileSize;
    data['UniqueID'] = this.uniqueID;
    data['Attachment'] = this.attachment;
    data['URL'] = this.uRL;
    return data;
  }
}