class Item {
  int? id;
  String? name;
  String? additional_notes;
  int quantity;
  Function(Item item)? deleteCallback;
  String? image;
  String? requirements;

  Item(
      {this.id,
      this.name,
      this.additional_notes,
      this.quantity = 1,
      this.image,
      this.requirements,
      this.deleteCallback});

  @override
  String toString() {
    return 'Item(id:$id,name: $name, additional_notes: $additional_notes, quantity: $quantity, image: $image)';
  }

  delete() {
    deleteCallback?.call(this);
  }

  Map<String,dynamic> toJson() => {
    "product_id": id,
    "name": name,
    "additional_notes": additional_notes,
    "quantity": quantity,
    "image": image,
    "requirements": requirements,
  };
}
