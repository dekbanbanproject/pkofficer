class ArticleModel {
  String? articleId;
  String? articleNum;
  String? articleName;
  String? articlePrice;
  String? articleYear;
  String? articleRecieveDate;
  String? articleTypeid;
  String? articleTypename;
  String? articleCategoryid;
  String? articleCategoryname;
  String? articleGroupid;
  String? articleGroupname;
  String? articleStatusId;
  String? articleImg;
  String? articleImgName;
  String? storeId;
  String? cctv;
  String? cctvLocation;
  String? cctvLocationDetail;
  String? cctvType;
  String? cctvCode;
  String? cctvMonitor;
  String? cctvStatus;
  
  ArticleModel(
      {this.articleId,
      this.articleNum,
      this.articleName,
      this.articlePrice,
      this.articleYear,
      this.articleRecieveDate,
      this.articleTypeid,
      this.articleTypename,
      this.articleCategoryid,
      this.articleCategoryname,
      this.articleGroupid,
      this.articleGroupname,
      this.articleStatusId,
      this.articleImg,
      this.articleImgName,
      this.storeId,
      this.cctv,
      this.cctvLocation,
      this.cctvLocationDetail,
      this.cctvType,
      this.cctvCode,
      this.cctvMonitor,
      this.cctvStatus});

  ArticleModel.fromJson(Map<String, dynamic> json) {
      // id: map['id'] == null ? '' : map['id'], 
    articleId = json['article_id'] ?? '';
    articleNum = json['article_num'] ?? '';
    articleName = json['article_name'] ?? '';
    articlePrice = json['article_price'] ?? '';
    articleYear = json['article_year'] ?? '';
    articleRecieveDate = json['article_recieve_date'] ?? '';
    articleTypeid = json['article_typeid'] ?? '';
    articleTypename = json['article_typename'] ?? '';
    articleCategoryid = json['article_categoryid'] ?? '';
    articleCategoryname = json['article_categoryname'] ?? '';
    articleGroupid = json['article_groupid'] ?? '';
    articleGroupname = json['article_groupname'] ?? '';
    articleStatusId = json['article_status_id'] ?? '';
    articleImg = json['article_img'] ?? '';
    articleImgName = json['article_img_name'] ?? '';
    storeId = json['store_id'] ?? '';
    cctv = json['cctv'] ?? '';
    cctvLocation = json['cctv_location'] ?? '';
    cctvLocationDetail = json['cctv_location_detail'] ?? '';
    cctvType = json['cctv_type'] ?? '';
    cctvCode = json['cctv_code'] ?? '';
    cctvMonitor = json['cctv_monitor'] ?? '';
    cctvStatus = json['cctv_status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = articleId;
    data['article_num'] = articleNum;
    data['article_name'] = articleName;
    data['article_price'] = articlePrice;
    data['article_year'] = articleYear;
    data['article_recieve_date'] = articleRecieveDate;
    data['article_typeid'] = articleTypeid;
    data['article_typename'] = articleTypename;
    data['article_categoryid'] = articleCategoryid;
    data['article_categoryname'] = articleCategoryname;
    data['article_groupid'] = articleGroupid;
    data['article_groupname'] = articleGroupname;
    data['article_status_id'] = articleStatusId;
    data['article_img'] = articleImg;
    data['article_img_name'] = articleImgName;
    data['store_id'] = storeId;
    data['cctv'] = cctv;
    data['cctv_location'] = cctvLocation;
    data['cctv_location_detail'] = cctvLocationDetail;
    data['cctv_type'] = cctvType;
    data['cctv_code'] = cctvCode;
    data['cctv_monitor'] = cctvMonitor;
    data['cctv_status'] = cctvStatus;
    return data;
  }

  void add(ArticleModel articleModel) {}
}
