class Fdhminidatasetmodel {
  String? fdh_mini_dataset_id;
  String? service_date_time;
  String? cid;
  String? hcode;
  String? total_amout;
  String? invoice_number;
  String? vn;
  String? pttype;
  String? hn;
  String? ptname;
  String? vstdate;
  String? transaction_uid;
  String? id_booking;
  String? uuid_booking;

  Fdhminidatasetmodel({
    this.fdh_mini_dataset_id,
    this.service_date_time,
    this.cid,
    this.hcode,
    this.total_amout,
    this.invoice_number,
    this.vn,
    this.pttype,
    this.hn,
    this.ptname,
    this.vstdate,
    this.transaction_uid,
    this.id_booking,
    this.uuid_booking,
  });

  Fdhminidatasetmodel.fromJson(Map<String, dynamic> json) {
    // id: map['id'] == null ? '' : map['id'],
    fdh_mini_dataset_id =
        json['fdh_mini_dataset_id'] ?? '';
    service_date_time =
        json['service_date_time'] ?? '';
    cid = json['cid'] ?? '';
    hcode = json['hcode'] ?? '';
    total_amout = json['total_amout'] ?? '';
    invoice_number =
        json['invoice_number'] ?? '';
    vn = json['vn'] ?? '';
    pttype = json['pttype'] ?? '';
    hn = json['hn'] ?? '';
    ptname = json['ptname'] ?? '';
    vstdate = json['vstdate'] ?? '';
    transaction_uid =
        json['transaction_uid'] ?? '';
    id_booking = json['id_booking'] ?? '';
    uuid_booking = json['uuid_booking'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fdh_mini_dataset_id'] = fdh_mini_dataset_id;
    data['service_date_time'] = service_date_time;
    data['cid'] = cid;
    data['hcode'] = hcode;
    data['total_amout'] = total_amout;
    data['invoice_number'] = invoice_number;
    data['vn'] = vn;
    data['pttype'] = pttype;
    data['hn'] = hn;
    data['ptname'] = ptname;
    data['vstdate'] = vstdate;
    data['transaction_uid'] = transaction_uid;
    data['id_booking'] = id_booking;
    data['uuid_booking'] = uuid_booking;
    return data;
  }

  void add(Fdhminidatasetmodel fdhminidatasetModel) {}

 
}
