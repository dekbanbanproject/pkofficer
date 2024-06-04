class FireChangmodel {
  String? fire_chang_id;
  String? fire_id;
  String? fire_num;
  String? fire_chang_date;
  String? userid;
  String? fire_chang_comment;
  String? fire_num_chang; 

  FireChangmodel({
    this.fire_chang_id,
    this.fire_id,
    this.fire_num,
    this.fire_chang_date,
    this.userid,
    this.fire_chang_comment,
    this.fire_num_chang, 
  });

  FireChangmodel.fromJson(Map<String, dynamic> json) {
    // id: map['id'] == null ? '' : map['id'],
    fire_chang_id = json['fire_chang_id'] ?? '';
    fire_id = json['fire_id'] ?? '';
    fire_num = json['fire_num'] ?? '';
    fire_chang_date =
        json['fire_chang_date'] ?? '';
    userid =
        json['userid'] ?? '';
    fire_chang_comment = json['fire_chang_comment'] ?? '';
    fire_num_chang = json['fire_num_chang'] ?? ''; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fire_chang_id'] = fire_chang_id;
    data['fire_id'] = fire_id;
    data['fire_num'] = fire_num;
    data['fire_chang_date'] = fire_chang_date;
    data['userid'] = userid;
    data['fire_chang_comment'] = fire_chang_comment;
    data['fire_num_chang'] = fire_num_chang; 
    return data;
  }

  void add(FireChangmodel firechangModel) {}
}
