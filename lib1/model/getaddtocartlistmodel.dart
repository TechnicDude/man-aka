class Getaddtocartlistmodel {
  String? status;
  GetaddtocartlistmodelData? data;
  int? totalAmount;

  Getaddtocartlistmodel({this.status, this.data, this.totalAmount});

  Getaddtocartlistmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? GetaddtocartlistmodelData.fromJson(json['data'])
        : null;
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class GetaddtocartlistmodelData {
  List<GetaddtocartlistmodelDataData>? data;
  int? total;

  GetaddtocartlistmodelData({this.data, this.total});

  GetaddtocartlistmodelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetaddtocartlistmodelDataData>[];
      json['data'].forEach((v) {
        data!.add(GetaddtocartlistmodelDataData.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class GetaddtocartlistmodelDataData {
  int? id;
  int? userId;
  int? productId;
  String? productVariationId;
  String? quantity;
  String? price;
  int? subTotal;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? taxes;
  String? variation;
  Product? product;

  GetaddtocartlistmodelDataData(
      {this.id,
      this.userId,
      this.productId,
      this.productVariationId,
      this.quantity,
      this.price,
      this.subTotal,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.taxes,
      this.variation,
      this.product});

  GetaddtocartlistmodelDataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productVariationId = json['product_variation_id'].toString();
    quantity = json['quantity'].toString();
    price = json['price'].toString();
    subTotal = json['sub_total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    taxes = json['taxes'];
    variation = json['variation'].toString();

    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['product_variation_id'] = this.productVariationId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['sub_total'] = this.subTotal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['taxes'] = this.taxes;
    data['variation'] = this.variation;

    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
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
  ProductCategory? productCategory;

  Product(
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
      this.productCategory});

  Product.fromJson(Map<String, dynamic> json) {
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
    productCategory = json['product_category'] != null
        ? ProductCategory.fromJson(json['product_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
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


// class Getaddtocartlistmodel {
//   String? status;
//   GetaddtocartlistmodelData? data;
//   int? totalAmount;

//   Getaddtocartlistmodel({this.status, this.data, this.totalAmount});

//   Getaddtocartlistmodel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null
//         ? new GetaddtocartlistmodelData.fromJson(json['data'])
//         : null;
//     totalAmount = json['total_amount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['total_amount'] = this.totalAmount;
//     return data;
//   }
// }

// class GetaddtocartlistmodelData {
//   List<GetaddtocartlistmodelDataData>? data;
//   int? total;

//   GetaddtocartlistmodelData({this.data, this.total});

//   GetaddtocartlistmodelData.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <GetaddtocartlistmodelDataData>[];
//       json['data'].forEach((v) {
//         data!.add(new GetaddtocartlistmodelDataData.fromJson(v));
//       });
//     }
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['total'] = this.total;
//     return data;
//   }
// }

// class GetaddtocartlistmodelDataData {
//   int? id;
//   int? userId;
//   int? productId;
//   String? productVariationId;
//   String? quantity;
//   String? price;
//   int? subTotal;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   int? taxes;
//   String? variation;
//   Product? product;

//   GetaddtocartlistmodelDataData(
//       {this.id,
//       this.userId,
//       this.productId,
//       this.productVariationId,
//       this.quantity,
//       this.price,
//       this.subTotal,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.taxes,
//       this.variation,
//       this.product});

//   GetaddtocartlistmodelDataData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     productId = json['product_id'];
//     productVariationId = json['product_variation_id'];
//     quantity = json['quantity'].toString();
//     price = json['price'];
//     subTotal = json['sub_total'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     taxes = json['taxes'];
//     variation = json['variation'];
//     product =
//         json['product'] != null ? new Product.fromJson(json['product']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     data['product_variation_id'] = this.productVariationId;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['sub_total'] = this.subTotal;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     data['taxes'] = this.taxes;
//     data['variation'] = this.variation;
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     return data;
//   }
// }

// class Product {
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
//   String? customerRegularPrice;
//   String? customerSalePrice;
//   String? remark;
//   String? unitValue;
//   String? unitType;
//   String? orderMinQty;
//   ProductCategory? productCategory;

//   Product(
//       {this.id,
//       this.name,
//       this.description,
//       this.image,
//       this.gallery,
//       this.productSubCategoryId,
//       this.productCategoryId,
//       this.sellerId,
//       this.brandId,
//       this.type,
//       this.sku,
//       this.slug,
//       this.regularPrice,
//       this.salePrice,
//       this.stockQty,
//       this.stockAvailability,
//       this.rating,
//       this.gender,
//       this.shipping,
//       this.tags,
//       this.returnPolicy,
//       this.returnTime,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.verify,
//       this.customerRegularPrice,
//       this.customerSalePrice,
//       this.remark,
//       this.unitValue,
//       this.unitType,
//       this.orderMinQty,
//       this.productCategory});

//   Product.fromJson(Map<String, dynamic> json) {
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
//     customerRegularPrice = json['customer_regular_price'].toString();
//     customerSalePrice = json['customer_sale_price'].toString();
//     remark = json['remark'];
//     unitValue = json['unit_value'].toString();
//     unitType = json['unit_type'];
//     orderMinQty = json['order_min_qty'];
//     productCategory = json['product_category'] != null
//         ? new ProductCategory.fromJson(json['product_category'])
//         : null;
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
//     data['unit_value'] = this.unitValue;
//     data['unit_type'] = this.unitType;
//     data['order_min_qty'] = this.orderMinQty;
//     if (this.productCategory != null) {
//       data['product_category'] = this.productCategory!.toJson();
//     }
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
