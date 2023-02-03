class Product {
  String name;
  String category;
  int unitPrice;
  String? unitCalculation;
  int? quantity;
  int? amount;

  Product({
    required this.name,
    required this.category,
    required this.unitPrice,
    this.unitCalculation,
    this.quantity,
    this.amount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      category: json['category'],
      unitPrice: json['unitPrice'],
      unitCalculation: json['unitCalculation'],
      quantity: json['quantity'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['unitPrice'] = this.unitPrice;
    data['unitCalculation'] = this.unitCalculation;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    return data;
  }
}
