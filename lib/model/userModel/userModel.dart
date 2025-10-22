class UserModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? id;

  UserModel({this.createdAt, this.name, this.avatar, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
       createdAt:json['createdAt']?? "",
       name: json['name']??"",
       avatar: json['avatar']??"",
       id : json['id']??""
    );
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}
