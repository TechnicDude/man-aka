// class BannerListModel {
//   String? status;
//   BannerData? data;

//   BannerListModel({this.status, this.data});

//   BannerListModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new BannerData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class BannerData {
//   List<String>? banners;

//   BannerData({this.banners});

//   BannerData.fromJson(Map<String, dynamic> json) {
//     banners = json['banners'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['banners'] = this.banners;
//     return data;
//   }
// }

class HomeDashboardModel {
  String? status;
  HomeDashboardData? data;

  HomeDashboardModel({this.status, this.data});

  HomeDashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new HomeDashboardData.fromJson(json['data'])
        : null;
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

class HomeDashboardData {
  List<String>? banners;
  List<BestSellingProducts>? bestSellingProducts;

  HomeDashboardData({this.banners, this.bestSellingProducts});

  HomeDashboardData.fromJson(Map<String, dynamic> json) {
    banners = json['banners'].cast<String>();

    if (json['best_selling_products'] != null) {
      bestSellingProducts = <BestSellingProducts>[];
      json['best_selling_products'].forEach((v) {
        bestSellingProducts!.add(new BestSellingProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banners'] = this.banners;

    if (this.bestSellingProducts != null) {
      data['best_selling_products'] =
          this.bestSellingProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestSellingProducts {
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? gallery;
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
  List<String>? tags;
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
  String? productUnitType;
  String? productOrderMinQty;
  int? productUnitValue;
  String? productCategoryName;
  String? productCategorySlug;
  String? productSubCategoryName;
  String? productSubCategorySlug;
  String? brandName;
  String? brandSlug;
  String? productVerify;
  String? wishlistStatus;
  String? productVariationStockAvailability;
  int? productVariationRegularPrice;
  int? productVariationSalePrice;
  int? minRegularPrice;
  int? maxRegularPrice;

  BestSellingProducts(
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
      this.productUnitType,
      this.productOrderMinQty,
      this.productUnitValue,
      this.productCategoryName,
      this.productCategorySlug,
      this.productSubCategoryName,
      this.productSubCategorySlug,
      this.brandName,
      this.brandSlug,
      this.productVerify,
      this.wishlistStatus,
      this.productVariationStockAvailability,
      this.productVariationRegularPrice,
      this.productVariationSalePrice,
      this.minRegularPrice,
      this.maxRegularPrice});

  BestSellingProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
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
    tags = json['tags'].cast<String>();
    returnPolicy = json['return_policy'];
    returnTime = json['return_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    verify = json['verify'];
    customerRegularPrice = json['customer_regular_price'];
    customerSalePrice = json['customer_sale_price'];
    remark = json['remark'];
    unitValue = json['unit_value'];
    unitType = json['unit_type'];
    orderMinQty = json['order_min_qty'];
    productUnitType = json['product_unit_type'];
    productOrderMinQty = json['product_order_min_qty'];
    productUnitValue = json['product_unit_value'];
    productCategoryName = json['product_category_name'];
    productCategorySlug = json['product_category_slug'];
    productSubCategoryName = json['product_sub_category_name'];
    productSubCategorySlug = json['product_sub_category_slug'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    productVerify = json['product_verify'];
    wishlistStatus = json['wishlist_status'];
    productVariationStockAvailability =
        json['product_variation_stock_availability'];
    productVariationRegularPrice = json['product_variation_regular_price'];
    productVariationSalePrice = json['product_variation_sale_price'];
    minRegularPrice = json['min_regular_price'];
    maxRegularPrice = json['max_regular_price'];
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
    data['product_unit_type'] = this.productUnitType;
    data['product_order_min_qty'] = this.productOrderMinQty;
    data['product_unit_value'] = this.productUnitValue;
    data['product_category_name'] = this.productCategoryName;
    data['product_category_slug'] = this.productCategorySlug;
    data['product_sub_category_name'] = this.productSubCategoryName;
    data['product_sub_category_slug'] = this.productSubCategorySlug;
    data['brand_name'] = this.brandName;
    data['brand_slug'] = this.brandSlug;
    data['product_verify'] = this.productVerify;
    data['wishlist_status'] = this.wishlistStatus;
    data['product_variation_stock_availability'] =
        this.productVariationStockAvailability;
    data['product_variation_regular_price'] = this.productVariationRegularPrice;
    data['product_variation_sale_price'] = this.productVariationSalePrice;
    data['min_regular_price'] = this.minRegularPrice;
    data['max_regular_price'] = this.maxRegularPrice;
    return data;
  }
}
