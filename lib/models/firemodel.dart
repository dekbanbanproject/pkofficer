class Firemodel {
  String? fire_check_id;
  String? fire_num;
  String? fire_name;
  String? fire_check_color;
  String? fire_check_location;
  String? check_date;
  String? fire_check_injection;
  String? fire_check_joystick;
  String? fire_check_body;
  String? fire_check_gauge;
  String? fire_check_drawback;
  String? fire_check_injection_name;
  String? fire_check_joystick_name;
  String? fire_check_body_name;
  String? fire_check_gauge_name;
  String? fire_check_drawback_name;
  String? user_id;
   String? fire_id;

  Firemodel({
    this.fire_check_id,
    this.fire_num,
    this.fire_name,
    this.fire_check_color,
    this.fire_check_location,
    this.check_date,
    this.fire_check_injection,
    this.fire_check_joystick,
    this.fire_check_body,
    this.fire_check_gauge,
    this.fire_check_drawback,
      this.fire_check_injection_name,
    this.fire_check_joystick_name,
    this.fire_check_body_name,
    this.fire_check_gauge_name,
    this.fire_check_drawback_name,
    this.user_id,
     this.fire_id,
  });

  Firemodel.fromJson(Map<String, dynamic> json) {
    // id: map['id'] == null ? '' : map['id'],
    fire_check_id = json['fire_check_id'] ?? '';
    fire_num = json['fire_num'] ?? '';
    fire_name = json['fire_name'] ?? '';
    fire_check_color =
        json['fire_check_color'] ?? '';
    fire_check_location =
        json['fire_check_location'] ?? '';
    check_date = json['check_date'] ?? '';
    fire_check_injection = json['fire_check_injection'] ?? '';
    fire_check_joystick =
        json['fire_check_joystick'] ?? '';
    fire_check_body =
        json['fire_check_body'] ?? '';
    fire_check_gauge =
        json['fire_check_gauge'] ?? '';
    fire_check_drawback =
        json['fire_check_drawback'] ?? '';
        fire_check_injection_name = json['fire_check_injection_name'] ?? '';
    fire_check_joystick_name =
        json['fire_check_joystick_name'] ?? '';
    fire_check_body_name =
        json['fire_check_body_name'] ?? '';
    fire_check_gauge_name =
        json['fire_check_gauge_name'] ?? '';
    fire_check_drawback_name =
        json['fire_check_drawback_name'] ?? '';
    user_id = json['user_id'] ?? '';
    fire_id = json['fire_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fire_check_id'] = fire_check_id;
    data['fire_num'] = fire_num;
    data['fire_name'] = fire_name;
    data['fire_check_color'] = fire_check_color;
    data['fire_check_location'] = fire_check_location;
    data['check_date'] = check_date;
    data['fire_check_injection'] = fire_check_injection;
    data['fire_check_joystick'] = fire_check_joystick;
    data['fire_check_body'] = fire_check_body;
    data['fire_check_gauge'] = fire_check_gauge;
    data['fire_check_drawback'] = fire_check_drawback;
      data['fire_check_injection_name'] = fire_check_injection_name;
    data['fire_check_joystick_name'] = fire_check_joystick_name;
    data['fire_check_body_name'] = fire_check_body_name;
    data['fire_check_gauge_name'] = fire_check_gauge_name;
    data['fire_check_drawback_name'] = fire_check_drawback_name;
    data['user_id'] = user_id;
    data['fire_id'] = fire_id;
    return data;
  }

  void add(Firemodel firemodel) {}
}
