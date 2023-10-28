class WishlistModel {
  String? status;
  WishlistDatas? data;

  WishlistModel({this.status, this.data});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        json['data'] != null ? new WishlistDatas.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WishlistDatas {
  int? currentPage;
  List<WishlistDataData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  WishlistDatas(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  WishlistDatas.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <WishlistDataData>[];
      json['data'].forEach((v) {
        data!.add(new WishlistDataData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class WishlistDataData {
  int? id;
  String? name;
  String? description;
  String? image;
  String? gallery;
  int? productSubCategoryId;
  int? productCategoryId;
  int? sellerId;
  int? brandId;
  String? type;
  String? sku;
  String? slug;
  int? regularPrice;
  int? salePrice;
  int? stockQty;
  String? stockAvailability;
  double? rating;
  String? gender;
  String? shipping;
  String? tags;
  String? returnPolicy;
  int? returnTime;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? verify;
  String? customerRegularPrice;
  String? customerSalePrice;
  String? remark;
  int? unitValue;
  String? unitType;
  String? orderMinQty;
  String? productCategoryName;
  String? productCategorySlug;
  String? productSubCategoryName;
  String? productSubCategorySlug;
  String? brandName;
  String? brandSlug;
  String? wishlistStatus;
  String? minPrice;
  String? maxPrice;

  WishlistDataData(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.gallery,
      this.productSubCategoryId,
      this.productCategoryId,
      this.sellerId,
      this.brandId,
      this.type,
      this.sku,
      this.slug,
      this.regularPrice,
      this.salePrice,
      this.stockQty,
      this.stockAvailability,
      this.rating,
      this.gender,
      this.shipping,
      this.tags,
      this.returnPolicy,
      this.returnTime,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.verify,
      this.customerRegularPrice,
      this.customerSalePrice,
      this.remark,
      this.unitValue,
      this.unitType,
      this.orderMinQty,
      this.productCategoryName,
      this.productCategorySlug,
      this.productSubCategoryName,
      this.productSubCategorySlug,
      this.brandName,
      this.brandSlug,
      this.wishlistStatus,
      this.minPrice,
      this.maxPrice});

  WishlistDataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    gallery = json['gallery'];
    productSubCategoryId = json['product_sub_category_id'];
    productCategoryId = json['product_category_id'];
    sellerId = json['seller_id'];
    brandId = json['brand_id'];
    type = json['type'];
    sku = json['sku'];
    slug = json['slug'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    stockQty = json['stock_qty'];
    stockAvailability = json['stock_availability'];
    rating = json['rating'];
    gender = json['gender'];
    shipping = json['shipping'];
    tags = json['tags'];
    returnPolicy = json['return_policy'];
    returnTime = json['return_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    verify = json['verify'];
    customerRegularPrice = json['customer_regular_price'].toString();
    customerSalePrice = json['customer_sale_price'].toString();
    remark = json['remark'];
    unitValue = json['unit_value'];
    unitType = json['unit_type'];
    orderMinQty = json['order_min_qty'];
    productCategoryName = json['product_category_name'];
    productCategorySlug = json['product_category_slug'];
    productSubCategoryName = json['product_sub_category_name'];
    productSubCategorySlug = json['product_sub_category_slug'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    wishlistStatus = json['wishlist_status'];
    minPrice = json['min_price'].toString();
    maxPrice = json['max_price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['product_sub_category_id'] = this.productSubCategoryId;
    data['product_category_id'] = this.productCategoryId;
    data['seller_id'] = this.sellerId;
    data['brand_id'] = this.brandId;
    data['type'] = this.type;
    data['sku'] = this.sku;
    data['slug'] = this.slug;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['stock_qty'] = this.stockQty;
    data['stock_availability'] = this.stockAvailability;
    data['rating'] = this.rating;
    data['gender'] = this.gender;
    data['shipping'] = this.shipping;
    data['tags'] = this.tags;
    data['return_policy'] = this.returnPolicy;
    data['return_time'] = this.returnTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['verify'] = this.verify;
    data['customer_regular_price'] = this.customerRegularPrice;
    data['customer_sale_price'] = this.customerSalePrice;
    data['remark'] = this.remark;
    data['unit_value'] = this.unitValue;
    data['unit_type'] = this.unitType;
    data['order_min_qty'] = this.orderMinQty;
    data['product_category_name'] = this.productCategoryName;
    data['product_category_slug'] = this.productCategorySlug;
    data['product_sub_category_name'] = this.productSubCategoryName;
    data['product_sub_category_slug'] = this.productSubCategorySlug;
    data['brand_name'] = this.brandName;
    data['brand_slug'] = this.brandSlug;
    data['wishlist_status'] = this.wishlistStatus;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
