class Item {
  static int _counter = 0; // Static counter to ensure unique IDs
  final String id; // Use String type for ID
  String? name;
  String? additional_notes;
  int quantity;
  Function(Item item)? deleteCallback;
  String? image;
  String? requirements;
  int? product_id;

  Item({
    String? id, // You can provide a custom ID, or it will be generated automatically
    this.name,
    this.additional_notes,
    this.quantity = 1,
    this.image = "", // Provide a default value here
    this.requirements,
    this.deleteCallback,
    this.product_id,
  }) : id = id ?? (_counter++).toString(); // If no ID is provided, use the counter

  @override
  String toString() {
    return 'Item(id:$id,name: $name, additional_notes: $additional_notes, quantity: $quantity, image: $image)';
  }

  delete() {
    return deleteCallback?.call(this);
  }


bool isValid() {
    return additional_notes != null &&
        quantity > 0 &&
        image != null &&
        image!.isNotEmpty;
  }

  Map<String, dynamic> toJson() => {
        "product_id": product_id,
        "name": name,
        "additional_notes": additional_notes,
        "quantity": quantity,
        "image": image,
        "requirements": requirements,
      };
}
