class Categories {
  int? _totalSize;
  int? _parent_id;
  int? _offset;
  late List<CategoriesModel> _categories;
  List<CategoriesModel> get categories => _categories;

  Categories({
    required totalSize,
    required parent_id,
    required offset,
    required categories,
  }) {
    this._totalSize = totalSize;
    this._parent_id = parent_id;
    this._offset = offset;
    this._categories = categories;
  }

  Categories.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _parent_id = json['parent_id'];
    _offset = json['offset'];
    if (json['categories'] != null) {
      _categories = <CategoriesModel>[];
      json['categories'].forEach((v) {
        _categories.add(CategoriesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_size'] = _totalSize;
    data['parent_id'] = _parent_id;
    data['offset'] = _offset;
    if (_categories != null) {
      data['categories'] = _categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesModel {
  int? id;
  String? title;
  int? cheffId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int? order;
  String? description;
  String? img;
  int? released;

  CategoriesModel({
    this.id,
    this.title,
    this.cheffId,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.order,
    this.description,
    this.img,
    this.released,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    cheffId = json['cheff_id'];
    parentId = json['parentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    order = json['order'];
    description = json['description'];
    img = json['image'] ?? "img/food0.png";
    released = json['released'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['cheff_id'] = cheffId;
    data['parentId'] = parentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['order'] = order;
    data['description'] = description;
    data['image'] = img;
    data['released'] = released;
    return data;
  }
}
