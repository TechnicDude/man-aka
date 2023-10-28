class ProfileUserModel {
  String? status;
  ProfileUserData? data;

  ProfileUserModel({this.status, this.data});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new ProfileUserData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileUserData {
  int? id;
  String? email;
  int? state;
  int? verify;
  String? authyId;
  String? createdAt;
  String? updatedAt;
  Person? person;
  List<Roles>? roles;

  ProfileUserData(
      {this.id,
      this.email,
      this.state,
      this.verify,
      this.authyId,
      this.createdAt,
      this.updatedAt,
      this.person,
      this.roles});

  ProfileUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    state = json['state'];
    verify = json['verify'];
    authyId = json['authy_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['state'] = this.state;
    data['verify'] = this.verify;
    data['authy_id'] = this.authyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Person {
  int? id;
  String? name;
  String? lastName;
  String? address;
  String? phone;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Person(
      {this.id,
      this.name,
      this.lastName,
      this.address,
      this.phone,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}
