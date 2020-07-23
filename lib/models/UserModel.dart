class UserModel {
  Data data;
  int status;

  UserModel({this.data, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String apiKey;
  String emailAddress;
  String firstName;
  int id;
  String lastName;
  String password;
  String username;
  String imageUrl;

  Data(
      {this.apiKey,
      this.emailAddress,
      this.firstName,
      this.id,
      this.lastName,
      this.password,
      this.username,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
    emailAddress = json['email_address'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    password = json['password'];
    username = json['username'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_key'] = this.apiKey;
    data['email_address'] = this.emailAddress;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    data['password'] = this.password;
    data['username'] = this.username;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

