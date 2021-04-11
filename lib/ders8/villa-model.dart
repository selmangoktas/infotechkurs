class VillaModel {
  String id;
  String userId;
  String isActive;
  String rejectionNote;
  String phone;
  String message;
  String title;
  String content;
  String topImageText;
  String poolText;
  String topImageRightText;
  String type;
  String sale;
  String price;
  String oldPrice;
  String exc;
  String stock;
  String cargoPrice;
  String cargoAmount;
  String cargoCountry;
  String cargoCity;
  String cargoShipArea;
  String cargoFirm;
  String returnCargoFirm;
  String cargoNote;
  String contactType;
  String shippingTime;
  String classfieldContract;
  String interestClassified;
  String superClassified;
  String relatedClassified;
  String city;
  String district;
  String locality;
  String minNight;
  String mapIframe;
  String activities;
  String lat;
  String lng;
  String zoom;
  String confirm;
  String dates;
  String category;
  String theEnd;
  String theEndTime;
  String payment;
  String address;
  String showCount;
  String dropPrice;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String image;

  VillaModel(
      {this.id,
      this.userId,
      this.isActive,
      this.rejectionNote,
      this.phone,
      this.message,
      this.title,
      this.content,
      this.topImageText,
      this.poolText,
      this.topImageRightText,
      this.type,
      this.sale,
      this.price,
      this.oldPrice,
      this.exc,
      this.stock,
      this.cargoPrice,
      this.cargoAmount,
      this.cargoCountry,
      this.cargoCity,
      this.cargoShipArea,
      this.cargoFirm,
      this.returnCargoFirm,
      this.cargoNote,
      this.contactType,
      this.shippingTime,
      this.classfieldContract,
      this.interestClassified,
      this.superClassified,
      this.relatedClassified,
      this.city,
      this.district,
      this.locality,
      this.minNight,
      this.mapIframe,
      this.activities,
      this.lat,
      this.lng,
      this.zoom,
      this.confirm,
      this.dates,
      this.category,
      this.theEnd,
      this.theEndTime,
      this.payment,
      this.address,
      this.showCount,
      this.dropPrice,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.image});

  VillaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    isActive = json['is_active'];
    rejectionNote = json['rejection_note'];
    phone = json['phone'];
    message = json['message'];
    title = json['title'];
    content = json['content'];
    topImageText = json['top_image_text'];
    poolText = json['pool_text'];
    topImageRightText = json['top_image_right_text'];
    type = json['type'];
    sale = json['sale'];
    price = json['price'];
    oldPrice = json['old_price'];
    exc = json['exc'];
    stock = json['stock'];
    cargoPrice = json['cargo_price'];
    cargoAmount = json['cargo_amount'];
    cargoCountry = json['cargo_country'];
    cargoCity = json['cargo_city'];
    cargoShipArea = json['cargo_ship_area'];
    cargoFirm = json['cargo_firm'];
    returnCargoFirm = json['return_cargo_firm'];
    cargoNote = json['cargo_note'];
    contactType = json['contact_type'];
    shippingTime = json['shipping_time'];
    classfieldContract = json['classfield_contract'];
    interestClassified = json['interest_classified'];
    superClassified = json['super_classified'];
    relatedClassified = json['related_classified'];
    city = json['city'];
    district = json['district'];
    locality = json['locality'];
    minNight = json['min_night'];
    mapIframe = json['map_iframe'];
    activities = json['activities'];
    lat = json['lat'];
    lng = json['lng'];
    zoom = json['zoom'];
    confirm = json['confirm'];
    dates = json['dates'];
    category = json['category'];
    theEnd = json['the_end'];
    theEndTime = json['the_end_time'];
    payment = json['payment'];
    address = json['address'];
    showCount = json['show_count'];
    dropPrice = json['drop_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['is_active'] = this.isActive;
    data['rejection_note'] = this.rejectionNote;
    data['phone'] = this.phone;
    data['message'] = this.message;
    data['title'] = this.title;
    data['content'] = this.content;
    data['top_image_text'] = this.topImageText;
    data['pool_text'] = this.poolText;
    data['top_image_right_text'] = this.topImageRightText;
    data['type'] = this.type;
    data['sale'] = this.sale;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['exc'] = this.exc;
    data['stock'] = this.stock;
    data['cargo_price'] = this.cargoPrice;
    data['cargo_amount'] = this.cargoAmount;
    data['cargo_country'] = this.cargoCountry;
    data['cargo_city'] = this.cargoCity;
    data['cargo_ship_area'] = this.cargoShipArea;
    data['cargo_firm'] = this.cargoFirm;
    data['return_cargo_firm'] = this.returnCargoFirm;
    data['cargo_note'] = this.cargoNote;
    data['contact_type'] = this.contactType;
    data['shipping_time'] = this.shippingTime;
    data['classfield_contract'] = this.classfieldContract;
    data['interest_classified'] = this.interestClassified;
    data['super_classified'] = this.superClassified;
    data['related_classified'] = this.relatedClassified;
    data['city'] = this.city;
    data['district'] = this.district;
    data['locality'] = this.locality;
    data['min_night'] = this.minNight;
    data['map_iframe'] = this.mapIframe;
    data['activities'] = this.activities;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['zoom'] = this.zoom;
    data['confirm'] = this.confirm;
    data['dates'] = this.dates;
    data['category'] = this.category;
    data['the_end'] = this.theEnd;
    data['the_end_time'] = this.theEndTime;
    data['payment'] = this.payment;
    data['address'] = this.address;
    data['show_count'] = this.showCount;
    data['drop_price'] = this.dropPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['image'] = this.image;
    return data;
  }
}