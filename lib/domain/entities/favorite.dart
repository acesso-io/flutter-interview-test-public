class Favorite {
  int? id;

  Favorite({this.id});

  Favorite.fromJson(Map<String, dynamic> json) : id = json['id'];

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
