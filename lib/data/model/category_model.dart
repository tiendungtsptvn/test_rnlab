class CategoryModel {
  int? id;
  String? name;
  int? parent;
  List<CategoryModel>? categories;
  ImageCategory? image;
  int? count;
  bool isExpanded = false;

  CategoryModel(
      {this.id,
      this.name,
      this.parent,
      this.categories,
      this.image,
      this.count,
      this.isExpanded = false});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
    image = json['image'] != null ? ImageCategory.fromJson(json['image']) : null;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['parent'] = parent;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['count'] = count;
    return data;
  }
}

class ImageCategory {
  int? id;
  String? src;
  String? name;
  String? alt;
  String? thumbnail;
  String? medium;
  String? mediumLarge;
  String? large;
  String? s1536x1536;
  String? s2048x2048;
  String? wcprPhotoReviews;
  String? woocommerceThumbnail;
  String? woocommerceSingle;
  String? woocommerceGalleryThumbnail;
  String? shopCatalog;
  String? shopSingle;
  String? shopThumbnail;

  ImageCategory(
      {this.id,
      this.src,
      this.name,
      this.alt,
      this.thumbnail,
      this.medium,
      this.mediumLarge,
      this.large,
      this.s1536x1536,
      this.s2048x2048,
      this.wcprPhotoReviews,
      this.woocommerceThumbnail,
      this.woocommerceSingle,
      this.woocommerceGalleryThumbnail,
      this.shopCatalog,
      this.shopSingle,
      this.shopThumbnail});

  ImageCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
    thumbnail = json['thumbnail'];
    medium = json['medium'];
    mediumLarge = json['medium_large'];
    large = json['large'];
    s1536x1536 = json['1536x1536'];
    s2048x2048 = json['2048x2048'];
    wcprPhotoReviews = json['wcpr-photo-reviews'];
    woocommerceThumbnail = json['woocommerce_thumbnail'];
    woocommerceSingle = json['woocommerce_single'];
    woocommerceGalleryThumbnail = json['woocommerce_gallery_thumbnail'];
    shopCatalog = json['shop_catalog'];
    shopSingle = json['shop_single'];
    shopThumbnail = json['shop_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['src'] = src;
    data['name'] = name;
    data['alt'] = alt;
    data['thumbnail'] = thumbnail;
    data['medium'] = medium;
    data['medium_large'] = mediumLarge;
    data['large'] = large;
    data['1536x1536'] = s1536x1536;
    data['2048x2048'] = s2048x2048;
    data['wcpr-photo-reviews'] = wcprPhotoReviews;
    data['woocommerce_thumbnail'] = woocommerceThumbnail;
    data['woocommerce_single'] = woocommerceSingle;
    data['woocommerce_gallery_thumbnail'] = woocommerceGalleryThumbnail;
    data['shop_catalog'] = shopCatalog;
    data['shop_single'] = shopSingle;
    data['shop_thumbnail'] = shopThumbnail;
    return data;
  }
}
