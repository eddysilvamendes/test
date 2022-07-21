class Cheff {
  int? _totalSize;
  int? _parent_id;
  int? _offset;
  late List<CheffModel> _cheff;
  List<CheffModel> get cheff => _cheff;

  Cheff({
    required totalSize,
    required parent_id,
    required offset,
    required cheff,
  }) {
    this._totalSize = totalSize;
    this._parent_id = parent_id;
    this._offset = offset;
    this._cheff = cheff;
  }

  Cheff.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _parent_id = json['parent_id'];
    _offset = json['offset'];
    if (json['cheff'] != null) {
      _cheff = <CheffModel>[];
      json['cheff'].forEach((v) {
        _cheff.add(CheffModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_size'] = _totalSize;
    data['parent_id'] = _parent_id;
    data['offset'] = _offset;
    if (_cheff != null) {
      data['cheff'] = _cheff.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheffModel {
  int? id;
  String? title;
  String? phone;
  String? email;
  int? parentId;
  String? img;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? order;

  CheffModel({
    this.id,
    required this.title,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.order,
    this.img,
    this.email,
    this.phone,
    this.status,
  });

  CheffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? "No Cheff";
    phone = json['phone'];
    parentId = json['parentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    order = json['order'];
    email = json['email'];
    img = json['image'] ?? "img/food0.png";
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['phone'] = phone;
    data['parentId'] = parentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['order'] = order;
    data['email'] = email;
    data['image'] = img;
    data['status'] = status;
    return data;
  }
}
