// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductList productListModelFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListModelToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
    List<Product>? products;
    Params? params;

    ProductList({
        this.products,
        this.params,
    });

    factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "params": params?.toJson(),
    };
}

class Params {
    Area? area;
    bool? useCaching;
    List<String>? extend;
    List<dynamic>? customExtend;
    PcodeFromQ? pname;
    PcodeFromQ? pshort;
    PcodeFromQ? pfull;
    PcodeFromQ? pkeywords;
    List<dynamic>? feature;
    String? type;
    int? page;
    String? action;
    List<dynamic>? filterVariants;
    String? featuresHash;
    int? limit;
    int? bid;
    String? match;
    List<dynamic>? tracking;
    bool? getFrontendUrls;
    int? itemsPerPage;
    String? applyDisabledFilters;
    bool? loadProductsExtraData;
    dynamic storefront;
    String? companyIds;
    PcodeFromQ? subcats;
    PcodeFromQ? pcodeFromQ;
    PcodeFromQ? searchPerformed;
    bool? hideOutOfStockProducts;
    SortBy? sortBy;
    String? sortOrder;
    List<dynamic>? usergroupIds;
    bool? includeChildVariations;
    bool? groupChildVariations;
    String? sortOrderRev;
    String? totalItems;

    Params({
        this.area,
        this.useCaching,
        this.extend,
        this.customExtend,
        this.pname,
        this.pshort,
        this.pfull,
        this.pkeywords,
        this.feature,
        this.type,
        this.page,
        this.action,
        this.filterVariants,
        this.featuresHash,
        this.limit,
        this.bid,
        this.match,
        this.tracking,
        this.getFrontendUrls,
        this.itemsPerPage,
        this.applyDisabledFilters,
        this.loadProductsExtraData,
        this.storefront,
        this.companyIds,
        this.subcats,
        this.pcodeFromQ,
        this.searchPerformed,
        this.hideOutOfStockProducts,
        this.sortBy,
        this.sortOrder,
        this.usergroupIds,
        this.includeChildVariations,
        this.groupChildVariations,
        this.sortOrderRev,
        this.totalItems,
    });

    factory Params.fromJson(Map<String, dynamic> json) => Params(
        area: areaValues.map[json["area"]]!,
        useCaching: json["use_caching"],
        extend: json["extend"] == null ? [] : List<String>.from(json["extend"]!.map((x) => x)),
        customExtend: json["custom_extend"] == null ? [] : List<dynamic>.from(json["custom_extend"]!.map((x) => x)),
        pname: pcodeFromQValues.map[json["pname"]]!,
        pshort: pcodeFromQValues.map[json["pshort"]]!,
        pfull: pcodeFromQValues.map[json["pfull"]]!,
        pkeywords: pcodeFromQValues.map[json["pkeywords"]]!,
        feature: json["feature"] == null ? [] : List<dynamic>.from(json["feature"]!.map((x) => x)),
        type: json["type"],
        page: json["page"],
        action: json["action"],
        filterVariants: json["filter_variants"] == null ? [] : List<dynamic>.from(json["filter_variants"]!.map((x) => x)),
        featuresHash: json["features_hash"],
        limit: json["limit"],
        bid: json["bid"],
        match: json["match"],
        tracking: json["tracking"] == null ? [] : List<dynamic>.from(json["tracking"]!.map((x) => x)),
        getFrontendUrls: json["get_frontend_urls"],
        itemsPerPage: json["items_per_page"],
        applyDisabledFilters: json["apply_disabled_filters"],
        loadProductsExtraData: json["load_products_extra_data"],
        storefront: json["storefront"],
        companyIds: json["company_ids"],
        subcats: pcodeFromQValues.map[json["subcats"]]!,
        pcodeFromQ: pcodeFromQValues.map[json["pcode_from_q"]]!,
        searchPerformed: pcodeFromQValues.map[json["search_performed"]]!,
        hideOutOfStockProducts: json["hide_out_of_stock_products"],
        sortBy: sortByValues.map[json["sort_by"]]!,
        sortOrder: json["sort_order"],
        usergroupIds: json["usergroup_ids"] == null ? [] : List<dynamic>.from(json["usergroup_ids"]!.map((x) => x)),
        includeChildVariations: json["include_child_variations"],
        groupChildVariations: json["group_child_variations"],
        sortOrderRev: json["sort_order_rev"],
        totalItems: json["total_items"],
    );

    Map<String, dynamic> toJson() => {
        "area": areaValues.reverse[area],
        "use_caching": useCaching,
        "extend": extend == null ? [] : List<dynamic>.from(extend!.map((x) => x)),
        "custom_extend": customExtend == null ? [] : List<dynamic>.from(customExtend!.map((x) => x)),
        "pname": pcodeFromQValues.reverse[pname],
        "pshort": pcodeFromQValues.reverse[pshort],
        "pfull": pcodeFromQValues.reverse[pfull],
        "pkeywords": pcodeFromQValues.reverse[pkeywords],
        "feature": feature == null ? [] : List<dynamic>.from(feature!.map((x) => x)),
        "type": type,
        "page": page,
        "action": action,
        "filter_variants": filterVariants == null ? [] : List<dynamic>.from(filterVariants!.map((x) => x)),
        "features_hash": featuresHash,
        "limit": limit,
        "bid": bid,
        "match": match,
        "tracking": tracking == null ? [] : List<dynamic>.from(tracking!.map((x) => x)),
        "get_frontend_urls": getFrontendUrls,
        "items_per_page": itemsPerPage,
        "apply_disabled_filters": applyDisabledFilters,
        "load_products_extra_data": loadProductsExtraData,
        "storefront": storefront,
        "company_ids": companyIds,
        "subcats": pcodeFromQValues.reverse[subcats],
        "pcode_from_q": pcodeFromQValues.reverse[pcodeFromQ],
        "search_performed": pcodeFromQValues.reverse[searchPerformed],
        "hide_out_of_stock_products": hideOutOfStockProducts,
        "sort_by": sortByValues.reverse[sortBy],
        "sort_order": sortOrder,
        "usergroup_ids": usergroupIds == null ? [] : List<dynamic>.from(usergroupIds!.map((x) => x)),
        "include_child_variations": includeChildVariations,
        "group_child_variations": groupChildVariations,
        "sort_order_rev": sortOrderRev,
        "total_items": totalItems,
    };
}

enum Area { A, M }

final areaValues = EnumValues({
    "A": Area.A,
    "M": Area.M
});

enum PcodeFromQ { Y, N }

final pcodeFromQValues = EnumValues({
    "N": PcodeFromQ.N,
    "Y": PcodeFromQ.Y
});

enum SortBy { PRODUCT, FEATURE_VARIANT }

final sortByValues = EnumValues({
    "feature_variant": SortBy.FEATURE_VARIANT,
    "product": SortBy.PRODUCT
});

class Product {
    String? productId;
    String? product;
    Type? productType;
    String? parentProductId;
    String? productCode;
    Area? status;
    String? companyId;
    String? listPrice;
    String? amount;
    String? weight;
    String? length;
    String? width;
    String? height;
    String? shippingFreight;
    String? lowAvailLimit;
    String? timestamp;
    String? updatedTimestamp;
    String? usergroupIds;
    AgeVerification? isEdp;
    AgeVerification? edpShipping;
    AgeVerification? unlimitedDownload;
    AgeVerification? tracking;
    AgeVerification? freeShipping;
    ZeroPriceAction? zeroPriceAction;
    PcodeFromQ? isPbp;
    AgeVerification? isOp;
    AgeVerification? isOper;
    PcodeFromQ? isReturnable;
    String? returnPeriod;
    String? availSince;
    AgeVerification? outOfStockActions;
    String? localization;
    String? minQty;
    String? maxQty;
    String? qtyStep;
    String? listQtyCount;
    String? taxIds;
    AgeVerification? ageVerification;
    String? ageLimit;
    Type? optionsType;
    ExceptionsType? exceptionsType;
    DetailsLayout? detailsLayout;
    String? shippingParams;
    String? facebookObjType;
    String? buyNowUrl;
    String? unitsInProduct;
    String? showPricePerXUnits;
    String? price;
    String? unitName;
    List<int>? categoryIds;
    String? seoName;
    String? seoPath;
    int? mainCategory;
    dynamic optionsTypeRaw;
    dynamic exceptionsTypeRaw;
    dynamic trackingRaw;
    dynamic zeroPriceActionRaw;
    dynamic minQtyRaw;
    dynamic maxQtyRaw;
    dynamic qtyStepRaw;
    dynamic listQtyCountRaw;
    DetailsLayout? detailsLayoutRaw;
    List<dynamic>? variationFeatures;
    MainPair? mainPair;
    String? basePrice;
    List<dynamic>? selectedOptions;
    bool? hasOptions;
    List<dynamic>? productOptions;
    double? listDiscount;
    String? listDiscountPrc;
    Discounts? discounts;
    dynamic productFeatures;
    List<dynamic>? qtyContent;
    Map<String, ImagePair>? imagePairs;
    String? averageRating;
    String? reviewsCount;

    Product({
        this.productId,
        this.product,
        this.productType,
        this.parentProductId,
        this.productCode,
        this.status,
        this.companyId,
        this.listPrice,
        this.amount,
        this.weight,
        this.length,
        this.width,
        this.height,
        this.shippingFreight,
        this.lowAvailLimit,
        this.timestamp,
        this.updatedTimestamp,
        this.usergroupIds,
        this.isEdp,
        this.edpShipping,
        this.unlimitedDownload,
        this.tracking,
        this.freeShipping,
        this.zeroPriceAction,
        this.isPbp,
        this.isOp,
        this.isOper,
        this.isReturnable,
        this.returnPeriod,
        this.availSince,
        this.outOfStockActions,
        this.localization,
        this.minQty,
        this.maxQty,
        this.qtyStep,
        this.listQtyCount,
        this.taxIds,
        this.ageVerification,
        this.ageLimit,
        this.optionsType,
        this.exceptionsType,
        this.detailsLayout,
        this.shippingParams,
        this.facebookObjType,
        this.buyNowUrl,
        this.unitsInProduct,
        this.showPricePerXUnits,
        this.price,
        this.unitName,
        this.categoryIds,
        this.seoName,
        this.seoPath,
        this.mainCategory,
        this.optionsTypeRaw,
        this.exceptionsTypeRaw,
        this.trackingRaw,
        this.zeroPriceActionRaw,
        this.minQtyRaw,
        this.maxQtyRaw,
        this.qtyStepRaw,
        this.listQtyCountRaw,
        this.detailsLayoutRaw,
        this.variationFeatures,
        this.mainPair,
        this.basePrice,
        this.selectedOptions,
        this.hasOptions,
        this.productOptions,
        this.listDiscount,
        this.listDiscountPrc,
        this.discounts,
        this.productFeatures,
        this.qtyContent,
        this.imagePairs,
        this.averageRating,
        this.reviewsCount,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        product: json["product"],
        productType: typeValues.map[json["product_type"]]!,
        parentProductId: json["parent_product_id"],
        productCode: json["product_code"],
        status: areaValues.map[json["status"]]!,
        companyId: json["company_id"],
        listPrice: json["list_price"],
        amount: json["amount"],
        weight: json["weight"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        shippingFreight: json["shipping_freight"],
        lowAvailLimit: json["low_avail_limit"],
        timestamp: json["timestamp"],
        updatedTimestamp: json["updated_timestamp"],
        usergroupIds: json["usergroup_ids"],
        isEdp: ageVerificationValues.map[json["is_edp"]]!,
        edpShipping: ageVerificationValues.map[json["edp_shipping"]]!,
        unlimitedDownload: ageVerificationValues.map[json["unlimited_download"]]!,
        tracking: ageVerificationValues.map[json["tracking"]]!,
        freeShipping: ageVerificationValues.map[json["free_shipping"]]!,
        zeroPriceAction: zeroPriceActionValues.map[json["zero_price_action"]]!,
        isPbp: pcodeFromQValues.map[json["is_pbp"]]!,
        isOp: ageVerificationValues.map[json["is_op"]]!,
        isOper: ageVerificationValues.map[json["is_oper"]]!,
        isReturnable: pcodeFromQValues.map[json["is_returnable"]]!,
        returnPeriod: json["return_period"],
        availSince: json["avail_since"],
        outOfStockActions: ageVerificationValues.map[json["out_of_stock_actions"]]!,
        localization: json["localization"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        qtyStep: json["qty_step"],
        listQtyCount: json["list_qty_count"],
        taxIds: json["tax_ids"],
        ageVerification: ageVerificationValues.map[json["age_verification"]]!,
        ageLimit: json["age_limit"],
        optionsType: typeValues.map[json["options_type"]]!,
        exceptionsType: exceptionsTypeValues.map[json["exceptions_type"]]!,
        detailsLayout: detailsLayoutValues.map[json["details_layout"]]!,
        shippingParams: json["shipping_params"],
        facebookObjType: json["facebook_obj_type"],
        buyNowUrl: json["buy_now_url"],
        unitsInProduct: json["units_in_product"],
        showPricePerXUnits: json["show_price_per_x_units"],
        price: json["price"],
        unitName: json["unit_name"],
        categoryIds: json["category_ids"] == null ? [] : List<int>.from(json["category_ids"]!.map((x) => x)),
        seoName: json["seo_name"],
        seoPath: json["seo_path"],
        mainCategory: json["main_category"],
        optionsTypeRaw: json["options_type_raw"],
        exceptionsTypeRaw: json["exceptions_type_raw"],
        trackingRaw: json["tracking_raw"],
        zeroPriceActionRaw: json["zero_price_action_raw"],
        minQtyRaw: json["min_qty_raw"],
        maxQtyRaw: json["max_qty_raw"],
        qtyStepRaw: json["qty_step_raw"],
        listQtyCountRaw: json["list_qty_count_raw"],
        detailsLayoutRaw: detailsLayoutValues.map[json["details_layout_raw"]]!,
        variationFeatures: json["variation_features"] == null ? [] : List<dynamic>.from(json["variation_features"]!.map((x) => x)),
        mainPair: json["main_pair"] == null ? null : MainPair.fromJson(json["main_pair"]),
        basePrice: json["base_price"],
        selectedOptions: json["selected_options"] == null ? [] : List<dynamic>.from(json["selected_options"]!.map((x) => x)),
        hasOptions: json["has_options"],
        productOptions: json["product_options"] == null ? [] : List<dynamic>.from(json["product_options"]!.map((x) => x)),
        listDiscount: json["list_discount"]?.toDouble(),
        listDiscountPrc: json["list_discount_prc"],
        discounts: json["discounts"] == null ? null : Discounts.fromJson(json["discounts"]),
        productFeatures: json["product_features"],
        qtyContent: json["qty_content"] == null ? [] : List<dynamic>.from(json["qty_content"]!.map((x) => x)),
        imagePairs: Map.from(json["image_pairs"]!).map((k, v) => MapEntry<String, ImagePair>(k, ImagePair.fromJson(v))),
        averageRating: json["average_rating"],
        reviewsCount: json["reviews_count"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product": product,
        "product_type": typeValues.reverse[productType],
        "parent_product_id": parentProductId,
        "product_code": productCode,
        "status": areaValues.reverse[status],
        "company_id": companyId,
        "list_price": listPrice,
        "amount": amount,
        "weight": weight,
        "length": length,
        "width": width,
        "height": height,
        "shipping_freight": shippingFreight,
        "low_avail_limit": lowAvailLimit,
        "timestamp": timestamp,
        "updated_timestamp": updatedTimestamp,
        "usergroup_ids": usergroupIds,
        "is_edp": ageVerificationValues.reverse[isEdp],
        "edp_shipping": ageVerificationValues.reverse[edpShipping],
        "unlimited_download": ageVerificationValues.reverse[unlimitedDownload],
        "tracking": ageVerificationValues.reverse[tracking],
        "free_shipping": ageVerificationValues.reverse[freeShipping],
        "zero_price_action": zeroPriceActionValues.reverse[zeroPriceAction],
        "is_pbp": pcodeFromQValues.reverse[isPbp],
        "is_op": ageVerificationValues.reverse[isOp],
        "is_oper": ageVerificationValues.reverse[isOper],
        "is_returnable": pcodeFromQValues.reverse[isReturnable],
        "return_period": returnPeriod,
        "avail_since": availSince,
        "out_of_stock_actions": ageVerificationValues.reverse[outOfStockActions],
        "localization": localization,
        "min_qty": minQty,
        "max_qty": maxQty,
        "qty_step": qtyStep,
        "list_qty_count": listQtyCount,
        "tax_ids": taxIds,
        "age_verification": ageVerificationValues.reverse[ageVerification],
        "age_limit": ageLimit,
        "options_type": typeValues.reverse[optionsType],
        "exceptions_type": exceptionsTypeValues.reverse[exceptionsType],
        "details_layout": detailsLayoutValues.reverse[detailsLayout],
        "shipping_params": shippingParams,
        "facebook_obj_type": facebookObjType,
        "buy_now_url": buyNowUrl,
        "units_in_product": unitsInProduct,
        "show_price_per_x_units": showPricePerXUnits,
        "price": price,
        "unit_name": unitName,
        "category_ids": categoryIds == null ? [] : List<dynamic>.from(categoryIds!.map((x) => x)),
        "seo_name": seoName,
        "seo_path": seoPath,
        "main_category": mainCategory,
        "options_type_raw": optionsTypeRaw,
        "exceptions_type_raw": exceptionsTypeRaw,
        "tracking_raw": trackingRaw,
        "zero_price_action_raw": zeroPriceActionRaw,
        "min_qty_raw": minQtyRaw,
        "max_qty_raw": maxQtyRaw,
        "qty_step_raw": qtyStepRaw,
        "list_qty_count_raw": listQtyCountRaw,
        "details_layout_raw": detailsLayoutValues.reverse[detailsLayoutRaw],
        "variation_features": variationFeatures == null ? [] : List<dynamic>.from(variationFeatures!.map((x) => x)),
        "main_pair": mainPair?.toJson(),
        "base_price": basePrice,
        "selected_options": selectedOptions == null ? [] : List<dynamic>.from(selectedOptions!.map((x) => x)),
        "has_options": hasOptions,
        "product_options": productOptions == null ? [] : List<dynamic>.from(productOptions!.map((x) => x)),
        "list_discount": listDiscount,
        "list_discount_prc": listDiscountPrc,
        "discounts": discounts?.toJson(),
        "product_features": productFeatures,
        "qty_content": qtyContent == null ? [] : List<dynamic>.from(qtyContent!.map((x) => x)),
        "image_pairs": Map.from(imagePairs!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "average_rating": averageRating,
        "reviews_count": reviewsCount,
    };
}

enum AgeVerification { N, B }

final ageVerificationValues = EnumValues({
    "B": AgeVerification.B,
    "N": AgeVerification.N
});

enum DetailsLayout { DEFAULT }

final detailsLayoutValues = EnumValues({
    "default": DetailsLayout.DEFAULT
});

class Discounts {
    int? a;
    int? p;

    Discounts({
        this.a,
        this.p,
    });

    factory Discounts.fromJson(Map<String, dynamic> json) => Discounts(
        a: json["A"],
        p: json["P"],
    );

    Map<String, dynamic> toJson() => {
        "A": a,
        "P": p,
    };
}

enum ExceptionsType { F }

final exceptionsTypeValues = EnumValues({
    "F": ExceptionsType.F
});

class ImagePair {
    String? pairId;
    String? imageId;
    String? detailedId;
    String? position;
    String? objectId;
    SortBy? objectType;
    Detailed? detailed;
    Detailed? icon;

    ImagePair({
        this.pairId,
        this.imageId,
        this.detailedId,
        this.position,
        this.objectId,
        this.objectType,
        this.detailed,
        this.icon,
    });

    factory ImagePair.fromJson(Map<String, dynamic> json) => ImagePair(
        pairId: json["pair_id"],
        imageId: json["image_id"],
        detailedId: json["detailed_id"],
        position: json["position"],
        objectId: json["object_id"],
        objectType: sortByValues.map[json["object_type"]]!,
        detailed: json["detailed"] == null ? null : Detailed.fromJson(json["detailed"]),
        icon: json["icon"] == null ? null : Detailed.fromJson(json["icon"]),
    );

    Map<String, dynamic> toJson() => {
        "pair_id": pairId,
        "image_id": imageId,
        "detailed_id": detailedId,
        "position": position,
        "object_id": objectId,
        "object_type": sortByValues.reverse[objectType],
        "detailed": detailed?.toJson(),
        "icon": icon?.toJson(),
    };
}

class Detailed {
    String? objectId;
    SortBy? objectType;
    Area? type;
    String? imagePath;
    String? alt;
    String? imageX;
    String? imageY;
    String? httpImagePath;
    String? httpsImagePath;
    String? absolutePath;
    String? relativePath;
    bool? isHighRes;

    Detailed({
        this.objectId,
        this.objectType,
        this.type,
        this.imagePath,
        this.alt,
        this.imageX,
        this.imageY,
        this.httpImagePath,
        this.httpsImagePath,
        this.absolutePath,
        this.relativePath,
        this.isHighRes,
    });

    factory Detailed.fromJson(Map<String, dynamic> json) => Detailed(
        objectId: json["object_id"],
        objectType: sortByValues.map[json["object_type"]]!,
        type: areaValues.map[json["type"]]!,
        imagePath: json["image_path"],
        alt: json["alt"],
        imageX: json["image_x"],
        imageY: json["image_y"],
        httpImagePath: json["http_image_path"],
        httpsImagePath: json["https_image_path"],
        absolutePath: json["absolute_path"],
        relativePath: json["relative_path"],
        isHighRes: json["is_high_res"],
    );

    Map<String, dynamic> toJson() => {
        "object_id": objectId,
        "object_type": sortByValues.reverse[objectType],
        "type": areaValues.reverse[type],
        "image_path": imagePath,
        "alt": alt,
        "image_x": imageX,
        "image_y": imageY,
        "http_image_path": httpImagePath,
        "https_image_path": httpsImagePath,
        "absolute_path": absolutePath,
        "relative_path": relativePath,
        "is_high_res": isHighRes,
    };
}

class MainPair {
    String? pairId;
    String? imageId;
    String? detailedId;
    String? position;
    String? objectId;
    SortBy? objectType;
    Detailed? detailed;

    MainPair({
        this.pairId,
        this.imageId,
        this.detailedId,
        this.position,
        this.objectId,
        this.objectType,
        this.detailed,
    });

    factory MainPair.fromJson(Map<String, dynamic> json) => MainPair(
        pairId: json["pair_id"],
        imageId: json["image_id"],
        detailedId: json["detailed_id"],
        position: json["position"],
        objectId: json["object_id"],
        objectType: sortByValues.map[json["object_type"]]!,
        detailed: json["detailed"] == null ? null : Detailed.fromJson(json["detailed"]),
    );

    Map<String, dynamic> toJson() => {
        "pair_id": pairId,
        "image_id": imageId,
        "detailed_id": detailedId,
        "position": position,
        "object_id": objectId,
        "object_type": sortByValues.reverse[objectType],
        "detailed": detailed?.toJson(),
    };
}

enum Type { P }

final typeValues = EnumValues({
    "P": Type.P
});

class ProductFeature {
    String? featureId;
    String? value;
    dynamic valueInt;
    String? variantId;
    FeatureType? featureType;
    Description? internalName;
    Description? description;
    String? prefix;
    String? suffix;
    String? variant;
    String? parentId;
    PcodeFromQ? displayOnHeader;
    PcodeFromQ? displayOnCatalog;
    PcodeFromQ? displayOnProduct;
    String? featureCode;
    Purpose? purpose;
    String? featuresHash;
    Map<String, Variant>? variants;

    ProductFeature({
        this.featureId,
        this.value,
        this.valueInt,
        this.variantId,
        this.featureType,
        this.internalName,
        this.description,
        this.prefix,
        this.suffix,
        this.variant,
        this.parentId,
        this.displayOnHeader,
        this.displayOnCatalog,
        this.displayOnProduct,
        this.featureCode,
        this.purpose,
        this.featuresHash,
        this.variants,
    });

    factory ProductFeature.fromJson(Map<String, dynamic> json) => ProductFeature(
        featureId: json["feature_id"],
        value: json["value"],
        valueInt: json["value_int"],
        variantId: json["variant_id"],
        featureType: featureTypeValues.map[json["feature_type"]]!,
        internalName: descriptionValues.map[json["internal_name"]]!,
        description: descriptionValues.map[json["description"]]!,
        prefix: json["prefix"],
        suffix: json["suffix"],
        variant: json["variant"],
        parentId: json["parent_id"],
        displayOnHeader: pcodeFromQValues.map[json["display_on_header"]]!,
        displayOnCatalog: pcodeFromQValues.map[json["display_on_catalog"]]!,
        displayOnProduct: pcodeFromQValues.map[json["display_on_product"]]!,
        featureCode: json["feature_code"],
        purpose: purposeValues.map[json["purpose"]]!,
        featuresHash: json["features_hash"],
        variants: Map.from(json["variants"]!).map((k, v) => MapEntry<String, Variant>(k, Variant.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "feature_id": featureId,
        "value": value,
        "value_int": valueInt,
        "variant_id": variantId,
        "feature_type": featureTypeValues.reverse[featureType],
        "internal_name": descriptionValues.reverse[internalName],
        "description": descriptionValues.reverse[description],
        "prefix": prefix,
        "suffix": suffix,
        "variant": variant,
        "parent_id": parentId,
        "display_on_header": pcodeFromQValues.reverse[displayOnHeader],
        "display_on_catalog": pcodeFromQValues.reverse[displayOnCatalog],
        "display_on_product": pcodeFromQValues.reverse[displayOnProduct],
        "feature_code": featureCode,
        "purpose": purposeValues.reverse[purpose],
        "features_hash": featuresHash,
        "variants": Map.from(variants!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

enum Description { BRAND, DISPLAY, OPERATING_SYSTEM, STORAGE_CAPACITY }

final descriptionValues = EnumValues({
    "Brand": Description.BRAND,
    "Display": Description.DISPLAY,
    "Operating System": Description.OPERATING_SYSTEM,
    "Storage Capacity": Description.STORAGE_CAPACITY
});

enum FeatureType { E, S }

final featureTypeValues = EnumValues({
    "E": FeatureType.E,
    "S": FeatureType.S
});

enum Purpose { ORGANIZE_CATALOG, FIND_PRODUCTS }

final purposeValues = EnumValues({
    "find_products": Purpose.FIND_PRODUCTS,
    "organize_catalog": Purpose.ORGANIZE_CATALOG
});

class Variant {
    String? value;
    dynamic valueInt;
    String? variantId;
    String? variant;
    dynamic imagePairs;

    Variant({
        this.value,
        this.valueInt,
        this.variantId,
        this.variant,
        this.imagePairs,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        value: json["value"],
        valueInt: json["value_int"],
        variantId: json["variant_id"],
        variant: json["variant"],
        imagePairs: json["image_pairs"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "value_int": valueInt,
        "variant_id": variantId,
        "variant": variant,
        "image_pairs": imagePairs,
    };
}

class ImagePairsClass {
    String? pairId;
    String? imageId;
    String? detailedId;
    String? position;
    String? objectId;
    SortBy? objectType;
    Detailed? icon;

    ImagePairsClass({
        this.pairId,
        this.imageId,
        this.detailedId,
        this.position,
        this.objectId,
        this.objectType,
        this.icon,
    });

    factory ImagePairsClass.fromJson(Map<String, dynamic> json) => ImagePairsClass(
        pairId: json["pair_id"],
        imageId: json["image_id"],
        detailedId: json["detailed_id"],
        position: json["position"],
        objectId: json["object_id"],
        objectType: sortByValues.map[json["object_type"]]!,
        icon: json["icon"] == null ? null : Detailed.fromJson(json["icon"]),
    );

    Map<String, dynamic> toJson() => {
        "pair_id": pairId,
        "image_id": imageId,
        "detailed_id": detailedId,
        "position": position,
        "object_id": objectId,
        "object_type": sortByValues.reverse[objectType],
        "icon": icon?.toJson(),
    };
}

enum ZeroPriceAction { R }

final zeroPriceActionValues = EnumValues({
    "R": ZeroPriceAction.R
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
