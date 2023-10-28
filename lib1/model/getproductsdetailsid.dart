class GetproductsDetailsByIDModel {
  String? status;
  GetproductsDetailsByIDModelData? data;

  GetproductsDetailsByIDModel({this.status, this.data});

  GetproductsDetailsByIDModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new GetproductsDetailsByIDModelData.fromJson(json['data'])
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

class GetproductsDetailsByIDModelData {
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
  int? customerRegularPrice;
  int? customerSalePrice;
  String? remark;
  int? unitValue;
  String? unitType;
  String? orderMinQty;
  String? minRegularPrice;
  String? maxRegularPrice;
  String? wishlistStatus;
  ProductCategory? productCategory;
  ProductSubCategory? productSubCategory;
  ProductCategory? brand;
  Seller? seller;

  GetproductsDetailsByIDModelData(
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
      this.minRegularPrice,
      this.maxRegularPrice,
      this.wishlistStatus,
      this.productCategory,
      this.productSubCategory,
      this.brand,
      this.seller});

  GetproductsDetailsByIDModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];

    gallery = json["gallery"] == null
        ? []
        : List<String>.from(json["gallery"].map((x) => x));

    //gallery = json['gallery'].cast<String>();
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
    tags = json["gallery"] == null
        ? []
        : List<String>.from(json["tags"].map((x) => x));

    //  tags = json['tags'].cast<String>();
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
    minRegularPrice = json['min_regular_price'].toString();
    maxRegularPrice = json['max_regular_price'].toString();
    wishlistStatus = json['wishlist_status'];
    productCategory = json['product_category'] != null
        ? new ProductCategory.fromJson(json['product_category'])
        : null;
    productSubCategory = json['product_sub_category'] != null
        ? new ProductSubCategory.fromJson(json['product_sub_category'])
        : null;
    brand = json['brand'] != null
        ? new ProductCategory.fromJson(json['brand'])
        : null;
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
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
    data['min_regular_price'] = this.minRegularPrice;
    data['max_regular_price'] = this.maxRegularPrice;
    data['wishlist_status'] = this.wishlistStatus;
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
    }
    if (this.productSubCategory != null) {
      data['product_sub_category'] = this.productSubCategory!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    return data;
  }
}

class ProductCategory {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ProductCategory(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class ProductSubCategory {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  int? productCategoryId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ProductSubCategory(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.description,
      this.productCategoryId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProductSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    description = json['description'];
    productCategoryId = json['product_category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['description'] = this.description;
    data['product_category_id'] = this.productCategoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Seller {
  String? name;

  Seller({this.name});

  Seller.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}





// class GetproductsDetailsByIDModel {
//   String? status;
//   GetproductsDetailsByIDModelData? data;

//   GetproductsDetailsByIDModel({this.status, this.data});

//   GetproductsDetailsByIDModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null
//         ? new GetproductsDetailsByIDModelData.fromJson(json['data'])
//         : null;
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

// class GetproductsDetailsByIDModelData {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   List<String>? gallery;
//   int? productSubCategoryId;
//   int? productCategoryId;
//   int? sellerId;
//   int? brandId;
//   String? type;
//   String? sku;
//   String? slug;
//   int? regularPrice;
//   int? salePrice;
//   int? stockQty;
//   String? stockAvailability;
//   double? rating;
//   String? gender;
//   String? shipping;
//   List<String>? tags;
//   String? returnPolicy;
//   int? returnTime;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   String? verify;
//   int? customerRegularPrice;
//   int? customerSalePrice;
//   String? remark;
//   ProductCategory? productCategory;
//   ProductSubCategory? productSubCategory;
//   ProductCategory? brand;
//   Seller? seller;
//   int? unitvalue;
//   String? unittype;
//   String? wishliststatus;
//   String? minregularprice;
//   String? maxregularprice;

//   GetproductsDetailsByIDModelData({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.gallery,
//     this.productSubCategoryId,
//     this.productCategoryId,
//     this.sellerId,
//     this.brandId,
//     this.type,
//     this.sku,
//     this.slug,
//     this.regularPrice,
//     this.salePrice,
//     this.stockQty,
//     this.stockAvailability,
//     this.rating,
//     this.gender,
//     this.shipping,
//     this.tags,
//     this.returnPolicy,
//     this.returnTime,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.verify,
//     this.customerRegularPrice,
//     this.customerSalePrice,
//     this.remark,
//     this.productCategory,
//     this.productSubCategory,
//     this.brand,
//     this.seller,
//     this.unitvalue,
//     this.unittype,
//     this.wishliststatus,
//     this.minregularprice,
//     this.maxregularprice,
//   });

//   GetproductsDetailsByIDModelData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     gallery = json['gallery'].cast<String>();
//     productSubCategoryId = json['product_sub_category_id'];
//     productCategoryId = json['product_category_id'];
//     sellerId = json['seller_id'];
//     brandId = json['brand_id'];
//     type = json['type'];
//     sku = json['sku'];
//     slug = json['slug'];
//     regularPrice = json['regular_price'];
//     salePrice = json['sale_price'];
//     stockQty = json['stock_qty'];
//     stockAvailability = json['stock_availability'];
//     rating = json['rating'];
//     gender = json['gender'];
//     shipping = json['shipping'];
//     tags = json['tags'].cast<String>();
//     returnPolicy = json['return_policy'];
//     returnTime = json['return_time'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     verify = json['verify'];
//     customerRegularPrice = json['customer_regular_price'];
//     customerSalePrice = json['customer_sale_price'];
//     remark = json['remark'];
//     productCategory = json['product_category'] != null
//         ? new ProductCategory.fromJson(json['product_category'])
//         : null;
//     productSubCategory = json['product_sub_category'] != null
//         ? new ProductSubCategory.fromJson(json['product_sub_category'])
//         : null;
//     brand = json['brand'] != null
//         ? new ProductCategory.fromJson(json['brand'])
//         : null;
//     seller =
//         json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
//     unitvalue = json['unit_value'];
//     unittype = json['unit_type'];
//     wishliststatus = json['wishlist_status'];
//     minregularprice = json['min_regular_price'].toString();
//     maxregularprice = json['max_regular_price'].toString();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['gallery'] = this.gallery;
//     data['product_sub_category_id'] = this.productSubCategoryId;
//     data['product_category_id'] = this.productCategoryId;
//     data['seller_id'] = this.sellerId;
//     data['brand_id'] = this.brandId;
//     data['type'] = this.type;
//     data['sku'] = this.sku;
//     data['slug'] = this.slug;
//     data['regular_price'] = this.regularPrice;
//     data['sale_price'] = this.salePrice;
//     data['stock_qty'] = this.stockQty;
//     data['stock_availability'] = this.stockAvailability;
//     data['rating'] = this.rating;
//     data['gender'] = this.gender;
//     data['shipping'] = this.shipping;
//     data['tags'] = this.tags;
//     data['return_policy'] = this.returnPolicy;
//     data['return_time'] = this.returnTime;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     data['verify'] = this.verify;
//     data['customer_regular_price'] = this.customerRegularPrice;
//     data['customer_sale_price'] = this.customerSalePrice;
//     data['remark'] = this.remark;
//     if (this.productCategory != null) {
//       data['product_category'] = this.productCategory!.toJson();
//     }
//     if (this.productSubCategory != null) {
//       data['product_sub_category'] = this.productSubCategory!.toJson();
//     }
//     if (this.brand != null) {
//       data['brand'] = this.brand!.toJson();
//     }
//     if (this.seller != null) {
//       data['seller'] = this.seller!.toJson();
//     }
//     data['unit_value'] = this.unitvalue;
//     data['unit_type'] = this.unittype;
//     data['wishlist_status'] = this.wishliststatus;
//     data['min_regular_price'] = this.minregularprice;
//     data['max_regular_price'] = this.maxregularprice;

//     return data;
//   }
// }

// class ProductCategory {
//   int? id;
//   String? name;
//   String? slug;
//   String? description;
//   String? image;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   Null? deletedAt;

//   ProductCategory(
//       {this.id,
//       this.name,
//       this.slug,
//       this.description,
//       this.image,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   ProductCategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     description = json['description'];
//     image = json['image'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }

// class ProductSubCategory {
//   int? id;
//   String? name;
//   String? slug;
//   String? image;
//   String? description;
//   int? productCategoryId;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   ProductSubCategory(
//       {this.id,
//       this.name,
//       this.slug,
//       this.image,
//       this.description,
//       this.productCategoryId,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   ProductSubCategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//     description = json['description'];
//     productCategoryId = json['product_category_id'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['image'] = this.image;
//     data['description'] = this.description;
//     data['product_category_id'] = this.productCategoryId;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }

// class Seller {
//   String? name;

//   Seller({this.name});

//   Seller.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }
