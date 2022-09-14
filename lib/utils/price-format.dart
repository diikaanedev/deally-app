// ignore: file_names
int priceFormatByDii(double price) {
  String v = price.toString();

  int d = (v.length % 3);

  return v.length;
}
