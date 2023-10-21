class CategoryItem {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryItem(
      {this.id, this.name, this.image, this.creationAt, this.updatedAt});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
