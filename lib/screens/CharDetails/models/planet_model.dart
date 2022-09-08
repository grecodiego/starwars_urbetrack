class PlanetModel {
  String? _name;

  PlanetModel({
    String? name,
  }) {
    if (name != null) {
      _name = name;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;

  PlanetModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
  }
}
