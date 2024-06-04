class ArticleCheckModel {
  String? cctv_check_id ;
  String? articleNum;
  String? cctv_check_date;
  String? cctv_camera_screen;
  String? cctv_camera_corner;
  String? cctv_camera_drawback;
  String? cctv_camera_save;
  String? cctv_camera_power_backup;
  String? cctv_user_id; 
  
  ArticleCheckModel(
      {this.cctv_check_id ,
      this.articleNum,
      this.cctv_check_date,
      this.cctv_camera_screen,
      this.cctv_camera_corner,
      this.cctv_camera_drawback,
      this.cctv_camera_save,
      this.cctv_camera_power_backup,
      this.cctv_user_id, });

  ArticleCheckModel.fromJson(Map<String, dynamic> json) {
      // id: map['id'] == null ? '' : map['id'], 
    cctv_check_id  = json['cctv_check_id'] ?? '';
    articleNum = json['article_num'] ?? '';
    cctv_check_date = json['cctv_check_date'] ?? '';
    cctv_camera_screen = json['cctv_camera_screen'] ?? '';
    cctv_camera_corner = json['cctv_camera_corner'] ?? '';
    cctv_camera_drawback = json['cctv_camera_drawback'] ?? '';
    cctv_camera_save = json['cctv_camera_save'] ?? '';
    cctv_camera_power_backup = json['cctv_camera_power_backup'] ?? '';
    cctv_user_id = json['cctv_user_id'] ?? ''; 
     
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = cctv_check_id ;
    data['article_num'] = articleNum;
    data['cctv_check_date'] = cctv_check_date;
    data['cctv_camera_screen'] = cctv_camera_screen;
    data['cctv_camera_corner'] = cctv_camera_corner;
    data['cctv_camera_drawback'] = cctv_camera_drawback;
    data['cctv_camera_save'] = cctv_camera_save;
    data['cctv_camera_power_backup'] = cctv_camera_power_backup;
    data['cctv_user_id'] = cctv_user_id;  
    return data;
  }

  void add(ArticleCheckModel articleModel) {}
}
