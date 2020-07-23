class PostUserModel {
  int status;
  User user;

  PostUserModel({this.status, this.user});

  PostUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String apiKey;
  String emailAddress;
  String firstName;
  int id;
  String imageUrl;
  String lastName;
  String password;
  String username;

  User(
      {this.apiKey,
      this.emailAddress,
      this.firstName,
      this.id,
      this.imageUrl,
      this.lastName,
      this.password,
      this.username});

  User.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
    emailAddress = json['email_address'];
    firstName = json['first_name'];
    id = json['id'];
    imageUrl = json['image_url'];
    lastName = json['last_name'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_key'] = this.apiKey;
    data['email_address'] = this.emailAddress;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['last_name'] = this.lastName;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}
