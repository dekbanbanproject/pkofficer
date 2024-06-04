// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsersModel {
    late String id;
    late String pnamelong;
    late String fname;
    late String lname;
    late String cid;
    late String fingle;
    late String tel;
    late String username;
    late String passapp;
    late String email;
    late String emailverifiedat;
    late String remembertoken;
    late String password; 
    late String start_date;
    late String end_date;
    late String type;
    late String line_token;
    late String group_p4p;
    late String dep_id;
    late String dep_name;
    late String dep_subid;
    late String dep_subname;
    late String dep_subsubid;
    late String dep_subsubname;
    late String dep_subsubtrueid;
    late String dep_subsubtruename;
    late String users_type_id;
    late String users_type_name;
    late String users_group_id;
    late String users_group_name;
    late String position_id;
    late String position_name; 
    late String status;
    late String permiss_person;
    late String permiss_book;
    late String permiss_car;
    late String permiss_meetting;
    late String permiss_repair;
    late String permiss_com;
    late String permiss_medical;
    late String permiss_hosing;
    late String permiss_plan;
    late String permiss_asset;
    late String permiss_supplies;
    late String permiss_store;
    late String permiss_store_dug;
    late String permiss_pay;
    late String permiss_money;
    late String permiss_claim;
    late String permiss_ot;
    late String permiss_medicine;
    late String store_id;
    late String member_id;
    late String img;
    late String img_name;
    late String money;
    late String remember_token;
    late String color_ot;
    late String created_at;
    late String updated_at;
    late String permiss_gleave;
    late String permiss_p4p;
    late String permiss_time;
    late String permiss_env;
    late String permiss_account;
    late String permiss_dental;
    late String small_id;
    late String permiss_setting_account;
    late String permiss_setting_upstm;
    late String permiss_setting_env;
    late String permiss_ucs;
    late String permiss_sss;
    late String permiss_ofc;
    late String permiss_lgo;
    late String permiss_prb;
    late String permiss_ti;
    late String permiss_setting_warehouse;
    late String permiss_rep_money;
  UsersModel({
    required this.id,
    required this.pnamelong,
    required this.fname,
    required this.lname,
    required this.cid,
    required this.fingle,
    required this.tel,
    required this.username,
    required this.passapp,
    required this.email,
    required this.emailverifiedat,
    required this.remembertoken,
    required this.password,
    required this.start_date,
    required this.end_date,
    required this.type,
    required this.line_token,
    required this.group_p4p,
    required this.dep_id,
    required this.dep_name,
    required this.dep_subid,
    required this.dep_subname,
    required this.dep_subsubid,
    required this.dep_subsubname,
    required this.dep_subsubtrueid,
    required this.dep_subsubtruename,
    required this.users_type_id,
    required this.users_type_name,
    required this.users_group_id,
    required this.users_group_name,
    required this.position_id,
    required this.position_name,
    required this.status,
    required this.permiss_person,
    required this.permiss_book,
    required this.permiss_car,
    required this.permiss_meetting,
    required this.permiss_repair,
    required this.permiss_com,
    required this.permiss_medical,
    required this.permiss_hosing,
    required this.permiss_plan,
    required this.permiss_asset,
    required this.permiss_supplies,
    required this.permiss_store,
    required this.permiss_store_dug,
    required this.permiss_pay,
    required this.permiss_money,
    required this.permiss_claim,
    required this.permiss_ot,
    required this.permiss_medicine,
    required this.store_id,
    required this.member_id,
    required this.img,
    required this.img_name,
    required this.money,
    required this.remember_token,
    required this.color_ot,
    required this.created_at,
    required this.updated_at,
    required this.permiss_gleave,
    required this.permiss_p4p,
    required this.permiss_time,
    required this.permiss_env,
    required this.permiss_account,
    required this.permiss_dental,
    required this.small_id,
    required this.permiss_setting_account,
    required this.permiss_setting_upstm,
    required this.permiss_setting_env,
    required this.permiss_ucs,
    required this.permiss_sss,
    required this.permiss_ofc,
    required this.permiss_lgo,
    required this.permiss_prb,
    required this.permiss_ti,
    required this.permiss_setting_warehouse,
    required this.permiss_rep_money,
  });

  UsersModel copyWith({
     String? id,
     String? pnamelong,
     String? fname,
     String? lname,
     String? cid,
     String? fingle,
     String? tel,
     String? username,
     String? passapp,
     String? email,
     String? emailverifiedat,
     String? remembertoken,
     String? password,
     String? start_date,
     String? end_date,
     String? type,
     String? line_token,
     String? group_p4p,
     String? dep_id,
     String? dep_name,
     String? dep_subid,
     String? dep_subname,
     String? dep_subsubid,
     String? dep_subsubname,
     String? dep_subsubtrueid,
     String? dep_subsubtruename,
     String? users_type_id,
     String? users_type_name,
     String? users_group_id,
     String? users_group_name,
     String? position_id,
     String? position_name,
     String? status,
     String? permiss_person,
     String? permiss_book,
     String? permiss_car,
     String? permiss_meetting,
     String? permiss_repair,
     String? permiss_com,
     String? permiss_medical,
     String? permiss_hosing,
     String? permiss_plan,
     String? permiss_asset,
     String? permiss_supplies,
     String? permiss_store,
     String? permiss_store_dug,
     String? permiss_pay,
     String? permiss_money,
     String? permiss_claim,
     String? permiss_ot,
     String? permiss_medicine,
     String? store_id,
     String? member_id,
     String? img,
     String? img_name,
     String? money,
     String? remember_token,
     String? color_ot,
     String? created_at,
     String? updated_at,
     String? permiss_gleave,
     String? permiss_p4p,
     String? permiss_time,
     String? permiss_env,
     String? permiss_account,
     String? permiss_dental,
     String? small_id,
     String? permiss_setting_account,
     String? permiss_setting_upstm,
     String? permiss_setting_env,
     String? permiss_ucs,
     String? permiss_sss,
     String? permiss_ofc,
     String? permiss_lgo,
     String? permiss_prb,
     String? permiss_ti,
     String? permiss_setting_warehouse,
     String? permiss_rep_money,
  }) {
    return UsersModel(
      id: id ?? this.id,
      pnamelong: pnamelong ?? this.pnamelong,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      cid: cid ?? this.cid,
      fingle: fingle ?? this.fingle,
      tel: tel ?? this.tel,
      username: username ?? this.username,
      passapp: passapp ?? this.passapp,
      email: email ?? this.email,
      emailverifiedat: emailverifiedat ?? this.emailverifiedat,
      remembertoken: remembertoken ?? this.remembertoken,
      password: password ?? this.password,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      type: type ?? this.type,
      line_token: line_token ?? this.line_token,
      group_p4p: group_p4p ?? this.group_p4p,
      dep_id: dep_id ?? this.dep_id,
      dep_name: dep_name ?? this.dep_name,
      dep_subid: dep_subid ?? this.dep_subid,
      dep_subname: dep_subname ?? this.dep_subname,
      dep_subsubid: dep_subsubid ?? this.dep_subsubid,
      dep_subsubname: dep_subsubname ?? this.dep_subsubname,
      dep_subsubtrueid: dep_subsubtrueid ?? this.dep_subsubtrueid,
      dep_subsubtruename: dep_subsubtruename ?? this.dep_subsubtruename,
      users_type_id: users_type_id ?? this.users_type_id,
      users_type_name: users_type_name ?? this.users_type_name,
      users_group_id: users_group_id ?? this.users_group_id,
      users_group_name: users_group_name ?? this.users_group_name,
      position_id: position_id ?? this.position_id,
      position_name: position_name ?? this.position_name,
      status: status ?? this.status,
      permiss_person: permiss_person ?? this.permiss_person,
      permiss_book: permiss_book ?? this.permiss_book,
      permiss_car: permiss_car ?? this.permiss_car,
      permiss_meetting: permiss_meetting ?? this.permiss_meetting,
      permiss_repair: permiss_repair ?? this.permiss_repair,
      permiss_com: permiss_com ?? this.permiss_com,
      permiss_medical: permiss_medical ?? this.permiss_medical,
      permiss_hosing: permiss_hosing ?? this.permiss_hosing,
      permiss_plan: permiss_plan ?? this.permiss_plan,
      permiss_asset: permiss_asset ?? this.permiss_asset,
      permiss_supplies: permiss_supplies ?? this.permiss_supplies,
      permiss_store: permiss_store ?? this.permiss_store,
      permiss_store_dug: permiss_store_dug ?? this.permiss_store_dug,
      permiss_pay: permiss_pay ?? this.permiss_pay,
      permiss_money: permiss_money ?? this.permiss_money,
      permiss_claim: permiss_claim ?? this.permiss_claim,
      permiss_ot: permiss_ot ?? this.permiss_ot,
      permiss_medicine: permiss_medicine ?? this.permiss_medicine,
      store_id: store_id ?? this.store_id,
      member_id: member_id ?? this.member_id,
      img: img ?? this.img,
      img_name: img_name ?? this.img_name,
      money: money ?? this.money,
      remember_token: remember_token ?? this.remember_token,
      color_ot: color_ot ?? this.color_ot,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      permiss_gleave: permiss_gleave ?? this.permiss_gleave,
      permiss_p4p: permiss_p4p ?? this.permiss_p4p,
      permiss_time: permiss_time ?? this.permiss_time,
      permiss_env: permiss_env ?? this.permiss_env,
      permiss_account: permiss_account ?? this.permiss_account,
      permiss_dental: permiss_dental ?? this.permiss_dental,
      small_id: small_id ?? this.small_id,
      permiss_setting_account: permiss_setting_account ?? this.permiss_setting_account,
      permiss_setting_upstm: permiss_setting_upstm ?? this.permiss_setting_upstm,
      permiss_setting_env: permiss_setting_env ?? this.permiss_setting_env,
      permiss_ucs: permiss_ucs ?? this.permiss_ucs,
      permiss_sss: permiss_sss ?? this.permiss_sss,
      permiss_ofc: permiss_ofc ?? this.permiss_ofc,
      permiss_lgo: permiss_lgo ?? this.permiss_lgo,
      permiss_prb: permiss_prb ?? this.permiss_prb,
      permiss_ti: permiss_ti ?? this.permiss_ti,
      permiss_setting_warehouse: permiss_setting_warehouse ?? this.permiss_setting_warehouse,
      permiss_rep_money: permiss_rep_money ?? this.permiss_rep_money,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pnamelong': pnamelong,
      'fname': fname,
      'lname': lname,
      'cid': cid,
      'fingle': fingle,
      'tel': tel,
      'username': username,
      'passapp': passapp,
      'email': email,
      'emailverifiedat': emailverifiedat,
      'remembertoken': remembertoken,
      'password': password,
      'start_date': start_date,
      'end_date': end_date,
      'type': type,
      'line_token': line_token,
      'group_p4p': group_p4p,
      'dep_id': dep_id,
      'dep_name': dep_name,
      'dep_subid': dep_subid,
      'dep_subname': dep_subname,
      'dep_subsubid': dep_subsubid,
      'dep_subsubname': dep_subsubname,
      'dep_subsubtrueid': dep_subsubtrueid,
      'dep_subsubtruename': dep_subsubtruename,
      'users_type_id': users_type_id,
      'users_type_name': users_type_name,
      'users_group_id': users_group_id,
      'users_group_name': users_group_name,
      'position_id': position_id,
      'position_name': position_name,
      'status': status,
      'permiss_person': permiss_person,
      'permiss_book': permiss_book,
      'permiss_car': permiss_car,
      'permiss_meetting': permiss_meetting,
      'permiss_repair': permiss_repair,
      'permiss_com': permiss_com,
      'permiss_medical': permiss_medical,
      'permiss_hosing': permiss_hosing,
      'permiss_plan': permiss_plan,
      'permiss_asset': permiss_asset,
      'permiss_supplies': permiss_supplies,
      'permiss_store': permiss_store,
      'permiss_store_dug': permiss_store_dug,
      'permiss_pay': permiss_pay,
      'permiss_money': permiss_money,
      'permiss_claim': permiss_claim,
      'permiss_ot': permiss_ot,
      'permiss_medicine': permiss_medicine,
      'store_id': store_id,
      'member_id': member_id,
      'img': img,
      'img_name': img_name,
      'money': money,
      'remember_token': remember_token,
      'color_ot': color_ot,
      'created_at': created_at,
      'updated_at': updated_at,
      'permiss_gleave': permiss_gleave,
      'permiss_p4p': permiss_p4p,
      'permiss_time': permiss_time,
      'permiss_env': permiss_env,
      'permiss_account': permiss_account,
      'permiss_dental': permiss_dental,
      'small_id': small_id,
      'permiss_setting_account': permiss_setting_account,
      'permiss_setting_upstm': permiss_setting_upstm,
      'permiss_setting_env': permiss_setting_env,
      'permiss_ucs': permiss_ucs,
      'permiss_sss': permiss_sss,
      'permiss_ofc': permiss_ofc,
      'permiss_lgo': permiss_lgo,
      'permiss_prb': permiss_prb,
      'permiss_ti': permiss_ti,
      'permiss_setting_warehouse': permiss_setting_warehouse,
      'permiss_rep_money': permiss_rep_money,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] ?? '', 
      pnamelong: map['pnamelong'] ?? '', 
      fname: map['fname'] ?? '', 
      lname: map['lname'] ?? '', 
      cid: map['cid'] ?? '', 
      fingle: map['fingle'] ?? '', 
      tel: map['tel'] ?? '', 
      username: map['username'] ?? '', 
      passapp: map['passapp'] ?? '',  
      email: map['email'] ?? '',
      emailverifiedat: map['emailverifiedat'] ?? '',
      remembertoken: map['remembertoken'] ?? '',
      password: map['password'] ?? '',
      start_date: map['start_date'] ?? '',
      end_date: map['end_date'] ?? '',
      type: map['type'] ?? '',
      line_token: map['line_token'] ?? '',
      group_p4p: map['group_p4p'] ?? '',
      dep_id: map['dep_id'] ?? '',
      dep_name: map['dep_name'] ?? '', 
      dep_subid: map['dep_subid'] ?? '',
      dep_subname: map['dep_subname'] ?? '',
      dep_subsubid: map['dep_subsubid'] ?? '',
      dep_subsubname: map['dep_subsubname'] ?? '',
      dep_subsubtrueid: map['dep_subsubtrueid'] ?? '',
      dep_subsubtruename: map['dep_subsubtruename'] ?? '',
      users_type_id: map['users_type_id'] ?? '',
      users_type_name: map['users_type_name'] ?? '',
      users_group_id: map['users_group_id'] ?? '',
      users_group_name: map['users_group_name'] ?? '',
      position_id: map['position_id'] ?? '',
      position_name: map['position_name'] ?? '',
      status: map['status'] ?? '',
      permiss_person: map['permiss_person'] ?? '',
      permiss_book: map['permiss_book'] ?? '',
      permiss_car: map['permiss_car'] ?? '',
      permiss_meetting: map['permiss_meetting'] ?? '',
      permiss_repair: map['permiss_repair'] ?? '',
      permiss_com: map['permiss_com'] ?? '',
      permiss_medical: map['permiss_medical'] ?? '',
      permiss_hosing: map['permiss_hosing'] ?? '',
      permiss_plan: map['permiss_plan'] ?? '',
      permiss_asset: map['permiss_asset'] ?? '',
      permiss_supplies: map['permiss_supplies'] ?? '',
      permiss_store: map['permiss_store'] ?? '',
      permiss_store_dug: map['permiss_store_dug'] ?? '',
      permiss_pay: map['permiss_pay'] ?? '',
      permiss_money: map['permiss_money'] ?? '',
      permiss_claim: map['permiss_claim'] ?? '',
      permiss_ot: map['permiss_ot'] ?? '',
      permiss_medicine: map['permiss_medicine'] ?? '',
      store_id: map['store_id'] ?? '',
      member_id: map['member_id'] ?? '',
      img: map['img'] ?? '',
      img_name: map['img_name'] ?? '',
      money: map['money'] ?? '',
      remember_token: map['remember_token'] ?? '',
      color_ot: map['color_ot'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      permiss_gleave: map['permiss_gleave'] ?? '',
      permiss_p4p: map['permiss_p4p'] ?? '',
      permiss_time: map['permiss_time'] ?? '',
      permiss_env: map['permiss_env'] ?? '',
      permiss_account: map['permiss_account'] ?? '',
      permiss_dental: map['permiss_dental'] ?? '',
      small_id: map['small_id'] ?? '',
      permiss_setting_account: map['permiss_setting_account'] ?? '',
      permiss_setting_upstm: map['permiss_setting_upstm'] ?? '',
      permiss_setting_env: map['permiss_setting_env'] ?? '',
      permiss_ucs: map['permiss_ucs'] ?? '',
      permiss_sss: map['permiss_sss'] ?? '',
      permiss_ofc: map['permiss_ofc'] ?? '',
      permiss_lgo: map['permiss_lgo'] ?? '',
      permiss_prb: map['permiss_prb'] ?? '',
      permiss_ti: map['permiss_ti'] ?? '',
      permiss_setting_warehouse: map['permiss_setting_warehouse'] ?? '',
      permiss_rep_money: map['permiss_rep_money'] ?? '', 
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) => UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsersModel(id: $id, pnamelong: $pnamelong, fname: $fname, lname: $lname, cid: $cid, fingle: $fingle, tel: $tel, username: $username, passapp: $passapp, email: $email, emailverifiedat: $emailverifiedat, remembertoken: $remembertoken, password: $password, start_date: $start_date, end_date: $end_date, type: $type, line_token: $line_token, group_p4p: $group_p4p, dep_id: $dep_id, dep_name: $dep_name, dep_subid: $dep_subid, dep_subname: $dep_subname, dep_subsubid: $dep_subsubid, dep_subsubname: $dep_subsubname, dep_subsubtrueid: $dep_subsubtrueid, dep_subsubtruename: $dep_subsubtruename, users_type_id: $users_type_id, users_type_name: $users_type_name, users_group_id: $users_group_id, users_group_name: $users_group_name, position_id: $position_id, position_name: $position_name, status: $status, permiss_person: $permiss_person, permiss_book: $permiss_book, permiss_car: $permiss_car, permiss_meetting: $permiss_meetting, permiss_repair: $permiss_repair, permiss_com: $permiss_com, permiss_medical: $permiss_medical, permiss_hosing: $permiss_hosing, permiss_plan: $permiss_plan, permiss_asset: $permiss_asset, permiss_supplies: $permiss_supplies, permiss_store: $permiss_store, permiss_store_dug: $permiss_store_dug, permiss_pay: $permiss_pay, permiss_money: $permiss_money, permiss_claim: $permiss_claim, permiss_ot: $permiss_ot, permiss_medicine: $permiss_medicine, store_id: $store_id, member_id: $member_id, img: $img, img_name: $img_name, money: $money, remember_token: $remember_token, color_ot: $color_ot, created_at: $created_at, updated_at: $updated_at, permiss_gleave: $permiss_gleave, permiss_p4p: $permiss_p4p, permiss_time: $permiss_time, permiss_env: $permiss_env, permiss_account: $permiss_account, permiss_dental: $permiss_dental, small_id: $small_id, permiss_setting_account: $permiss_setting_account, permiss_setting_upstm: $permiss_setting_upstm, permiss_setting_env: $permiss_setting_env, permiss_ucs: $permiss_ucs, permiss_sss: $permiss_sss, permiss_ofc: $permiss_ofc, permiss_lgo: $permiss_lgo, permiss_prb: $permiss_prb, permiss_ti: $permiss_ti, permiss_setting_warehouse: $permiss_setting_warehouse, permiss_rep_money: $permiss_rep_money)';
  }

  @override
  bool operator ==(covariant UsersModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.pnamelong == pnamelong &&
      other.fname == fname &&
      other.lname == lname &&
      other.cid == cid &&
      other.fingle == fingle &&
      other.tel == tel &&
      other.username == username &&
      other.passapp == passapp &&
      other.email == email &&
      other.emailverifiedat == emailverifiedat &&
      other.remembertoken == remembertoken &&
      other.password == password &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.type == type &&
      other.line_token == line_token &&
      other.group_p4p == group_p4p &&
      other.dep_id == dep_id &&
      other.dep_name == dep_name &&
      other.dep_subid == dep_subid &&
      other.dep_subname == dep_subname &&
      other.dep_subsubid == dep_subsubid &&
      other.dep_subsubname == dep_subsubname &&
      other.dep_subsubtrueid == dep_subsubtrueid &&
      other.dep_subsubtruename == dep_subsubtruename &&
      other.users_type_id == users_type_id &&
      other.users_type_name == users_type_name &&
      other.users_group_id == users_group_id &&
      other.users_group_name == users_group_name &&
      other.position_id == position_id &&
      other.position_name == position_name &&
      other.status == status &&
      other.permiss_person == permiss_person &&
      other.permiss_book == permiss_book &&
      other.permiss_car == permiss_car &&
      other.permiss_meetting == permiss_meetting &&
      other.permiss_repair == permiss_repair &&
      other.permiss_com == permiss_com &&
      other.permiss_medical == permiss_medical &&
      other.permiss_hosing == permiss_hosing &&
      other.permiss_plan == permiss_plan &&
      other.permiss_asset == permiss_asset &&
      other.permiss_supplies == permiss_supplies &&
      other.permiss_store == permiss_store &&
      other.permiss_store_dug == permiss_store_dug &&
      other.permiss_pay == permiss_pay &&
      other.permiss_money == permiss_money &&
      other.permiss_claim == permiss_claim &&
      other.permiss_ot == permiss_ot &&
      other.permiss_medicine == permiss_medicine &&
      other.store_id == store_id &&
      other.member_id == member_id &&
      other.img == img &&
      other.img_name == img_name &&
      other.money == money &&
      other.remember_token == remember_token &&
      other.color_ot == color_ot &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.permiss_gleave == permiss_gleave &&
      other.permiss_p4p == permiss_p4p &&
      other.permiss_time == permiss_time &&
      other.permiss_env == permiss_env &&
      other.permiss_account == permiss_account &&
      other.permiss_dental == permiss_dental &&
      other.small_id == small_id &&
      other.permiss_setting_account == permiss_setting_account &&
      other.permiss_setting_upstm == permiss_setting_upstm &&
      other.permiss_setting_env == permiss_setting_env &&
      other.permiss_ucs == permiss_ucs &&
      other.permiss_sss == permiss_sss &&
      other.permiss_ofc == permiss_ofc &&
      other.permiss_lgo == permiss_lgo &&
      other.permiss_prb == permiss_prb &&
      other.permiss_ti == permiss_ti &&
      other.permiss_setting_warehouse == permiss_setting_warehouse &&
      other.permiss_rep_money == permiss_rep_money;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      pnamelong.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      cid.hashCode ^
      fingle.hashCode ^
      tel.hashCode ^
      username.hashCode ^
      passapp.hashCode ^
      email.hashCode ^
      emailverifiedat.hashCode ^
      remembertoken.hashCode ^
      password.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      type.hashCode ^
      line_token.hashCode ^
      group_p4p.hashCode ^
      dep_id.hashCode ^
      dep_name.hashCode ^
      dep_subid.hashCode ^
      dep_subname.hashCode ^
      dep_subsubid.hashCode ^
      dep_subsubname.hashCode ^
      dep_subsubtrueid.hashCode ^
      dep_subsubtruename.hashCode ^
      users_type_id.hashCode ^
      users_type_name.hashCode ^
      users_group_id.hashCode ^
      users_group_name.hashCode ^
      position_id.hashCode ^
      position_name.hashCode ^
      status.hashCode ^
      permiss_person.hashCode ^
      permiss_book.hashCode ^
      permiss_car.hashCode ^
      permiss_meetting.hashCode ^
      permiss_repair.hashCode ^
      permiss_com.hashCode ^
      permiss_medical.hashCode ^
      permiss_hosing.hashCode ^
      permiss_plan.hashCode ^
      permiss_asset.hashCode ^
      permiss_supplies.hashCode ^
      permiss_store.hashCode ^
      permiss_store_dug.hashCode ^
      permiss_pay.hashCode ^
      permiss_money.hashCode ^
      permiss_claim.hashCode ^
      permiss_ot.hashCode ^
      permiss_medicine.hashCode ^
      store_id.hashCode ^
      member_id.hashCode ^
      img.hashCode ^
      img_name.hashCode ^
      money.hashCode ^
      remember_token.hashCode ^
      color_ot.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      permiss_gleave.hashCode ^
      permiss_p4p.hashCode ^
      permiss_time.hashCode ^
      permiss_env.hashCode ^
      permiss_account.hashCode ^
      permiss_dental.hashCode ^
      small_id.hashCode ^
      permiss_setting_account.hashCode ^
      permiss_setting_upstm.hashCode ^
      permiss_setting_env.hashCode ^
      permiss_ucs.hashCode ^
      permiss_sss.hashCode ^
      permiss_ofc.hashCode ^
      permiss_lgo.hashCode ^
      permiss_prb.hashCode ^
      permiss_ti.hashCode ^
      permiss_setting_warehouse.hashCode ^
      permiss_rep_money.hashCode;
  }
}
