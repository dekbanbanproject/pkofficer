// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsersModel {
  String? id;
  String? pnamelong;
  String? fname;
  String? lname;
  String? cid;
  String? fingle;
  String? tel;
  String? username;
  String? passapp;
  String? email;
  String? password;
  String? start_date;
  String? end_date;
  String? type;
  String? line_token;
  String? dep_id;
  String? status;
  String? store_id;
  String? img;
  String? img_name;
  UsersModel(
      {this.id,
      this.pnamelong,
      this.fname,
      this.lname,
      this.cid,
      this.fingle,
      this.tel,
      this.username,
      this.passapp,
      this.email,
      this.password,
      this.start_date,
      this.end_date,
      this.type,
      this.line_token,
      this.dep_id,
      this.status,
      this.store_id,
      this.img,
      this.img_name});
  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    pnamelong = json['pnamelong'] ?? '';
    fname = json['fname'] ?? '';
    lname = json['lname'] ?? '';
    cid = json['cid'] ?? '';
    fingle = json['fingle'] ?? '';
    tel = json['tel'] ?? '';
    username = json['username'] ?? '';
    passapp = json['passapp'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    start_date = json['start_date'] ?? '';
    end_date = json['end_date'] ?? '';
    type = json['type'] ?? '';
    line_token = json['line_token'] ?? '';
    dep_id = json['dep_id'] ?? '';
    status = json['status'] ?? '';
    store_id = json['store_id'] ?? '';
    img = json['img'] ?? '';
    img_name = json['img_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pnamelong'] = pnamelong;
    data['fname'] = fname;
    data['lname'] = lname;
    data['cid'] = cid;
    data['fingle'] = fingle;
    data['tel'] = tel;
    data['username'] = username;
    data['passapp'] = passapp;
    data['email'] = email;
    data['password'] = password;
    data['start_date'] = start_date;
    data['end_date'] = end_date;
    data['type'] = type;
    data['line_token'] = line_token;
    data['dep_id'] = dep_id;
    data['status'] = status;
    data['store_id'] = store_id;
    data['img'] = img;
    data['img_name'] = img_name;
    return data;
  }

  void add(UsersModel usersModel) {}
 
}
