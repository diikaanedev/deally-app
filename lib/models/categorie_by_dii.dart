class CategorieShopList {
  final String url;
  final String nom;
  final String id;

  CategorieShopList({
    required this.url,
    required this.nom,
    required this.id,
  });

  static CategorieShopList fromJson(dynamic data) {
    return CategorieShopList(
        id: data['_id'], nom: data['title'], url: data['image']['url']);
  }

  static List<CategorieShopList> fromCategorie({required data}) {
    List<CategorieShopList> liste = [];
    for (var item in data) {
      liste.add(fromJson(item));
    }
    return liste;
  }
}

List<CategorieShopList> listCategorieShopping = [
  CategorieShopList(url: "assets/images/beauty.png", nom: "Make up", id: ""),
  CategorieShopList(
      url: "assets/images/healt-pharmacy.webp",
      nom: "Health & Pharmacy",
      id: ""),
  CategorieShopList(
      url: "assets/images/toiletries.png", nom: "Toiletries", id: ""),
  CategorieShopList(
      url: "assets/images/mom-baby.jpeg", nom: "Mom & Baby", id: ""),
  CategorieShopList(
      url: "assets/images/home-category.jpg", nom: "Home", id: ""),
  CategorieShopList(
      url: "assets/images/luxury-beauty.jpeg", nom: "Luxury Beauty", id: ""),
];
