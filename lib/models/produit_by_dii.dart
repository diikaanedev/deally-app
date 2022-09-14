import 'package:deally_app/models/pack-discounts-model.dart';

class ProduitModel {
  final String id;
  final String name;
  final String description;
  final String location;
  final String saleEnd;
  final String stock;
  final String deliveryDelay;
  final String brand;
  final String storageCondition;
  final String rating;
  final List<PackDiscountsModel> packDiscounts;
  final List listImage;

  final String images;
  final int price;

  const ProduitModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.saleEnd,
    required this.stock,
    required this.deliveryDelay,
    required this.brand,
    required this.storageCondition,
    required this.images,
    required this.packDiscounts,
    required this.listImage,
    required this.price,
    required this.rating,
  });

  static ProduitModel fromObject(dynamic item) {
    return ProduitModel(
      id: item['_id'],
      images: item['images'][0]['url'],
      listImage: item['images'],
      packDiscounts:
          PackDiscountsModel.fromProducts(data: item['pack_price'] ?? []),
      storageCondition: item['storageCondition'] ?? "",
      deliveryDelay: item['deliveryDelay'] ?? "",
      brand: item['brand'] ?? "",
      name: item['name'] ?? "",
      description: item['description'] ?? "",
      location: item['address']['_id'] ?? "",
      saleEnd: item['saleEnd'] ?? "",
      stock: item['stock'] ?? "0",
      price: item['price'] ?? 0,
      rating: item['rating'] ?? "",
    );
  }

  static List<ProduitModel> fromJson({required List data}) {
    List<ProduitModel> liste = [];

    for (var item in data) {
      liste.add(ProduitModel(
        id: item['_id'],
        images: item['images'][0]['url'],
        listImage: item['images'],
        packDiscounts:
            PackDiscountsModel.fromProducts(data: item['pack_price'] ?? []),
        storageCondition: item['storageCondition'] ?? "",
        deliveryDelay: item['deliveryDelay'] ?? "",
        brand: item['brand'] ?? "",
        name: item['name'] ?? "",
        description: item['description'] ?? "",
        location: item['address']['_id'] ?? "",
        saleEnd: item['saleEnd'] ?? "",
        stock: item['stock'] ?? "0",
        price: item['price'] ?? 0,
        rating: item['rating'] ?? "",
      ));
    }

    return liste;
  }
}
