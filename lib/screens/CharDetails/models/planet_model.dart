class PlanetModel {
  String? _name;
  String? _rotationPeriod;
  String? _orbitalPeriod;
  String? _diameter;
  String? _climate;
  String? _gravity;
  String? _terrain;
  String? _surfaceWater;
  String? _population;
  List<String>? _residents;
  List<String>? _films;
  String? _created;
  String? _edited;
  String? _url;

  PlanetModel(
      {String? name,
      String? rotationPeriod,
      String? orbitalPeriod,
      String? diameter,
      String? climate,
      String? gravity,
      String? terrain,
      String? surfaceWater,
      String? population,
      List<String>? residents,
      List<String>? films,
      String? created,
      String? edited,
      String? url}) {
    if (name != null) {
      _name = name;
    }
    if (rotationPeriod != null) {
      _rotationPeriod = rotationPeriod;
    }
    if (orbitalPeriod != null) {
      _orbitalPeriod = orbitalPeriod;
    }
    if (diameter != null) {
      _diameter = diameter;
    }
    if (climate != null) {
      _climate = climate;
    }
    if (gravity != null) {
      _gravity = gravity;
    }
    if (terrain != null) {
      _terrain = terrain;
    }
    if (surfaceWater != null) {
      _surfaceWater = surfaceWater;
    }
    if (population != null) {
      _population = population;
    }
    if (residents != null) {
      _residents = residents;
    }
    if (films != null) {
      _films = films;
    }
    if (created != null) {
      _created = created;
    }
    if (edited != null) {
      _edited = edited;
    }
    if (url != null) {
      _url = url;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get rotationPeriod => _rotationPeriod;
  set rotationPeriod(String? rotationPeriod) =>
      _rotationPeriod = rotationPeriod;
  String? get orbitalPeriod => _orbitalPeriod;
  set orbitalPeriod(String? orbitalPeriod) => _orbitalPeriod = orbitalPeriod;
  String? get diameter => _diameter;
  set diameter(String? diameter) => _diameter = diameter;
  String? get climate => _climate;
  set climate(String? climate) => _climate = climate;
  String? get gravity => _gravity;
  set gravity(String? gravity) => _gravity = gravity;
  String? get terrain => _terrain;
  set terrain(String? terrain) => _terrain = terrain;
  String? get surfaceWater => _surfaceWater;
  set surfaceWater(String? surfaceWater) => _surfaceWater = surfaceWater;
  String? get population => _population;
  set population(String? population) => _population = population;
  List<String>? get residents => _residents;
  set residents(List<String>? residents) => _residents = residents;
  List<String>? get films => _films;
  set films(List<String>? films) => _films = films;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get edited => _edited;
  set edited(String? edited) => _edited = edited;
  String? get url => _url;
  set url(String? url) => _url = url;

  PlanetModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _rotationPeriod = json['rotation_period'];
    _orbitalPeriod = json['orbital_period'];
    _diameter = json['diameter'];
    _climate = json['climate'];
    _gravity = json['gravity'];
    _terrain = json['terrain'];
    _surfaceWater = json['surface_water'];
    _population = json['population'];
    _residents = json['residents'].cast<String>();
    _films = json['films'].cast<String>();
    _created = json['created'];
    _edited = json['edited'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = _name;
    data['rotation_period'] = _rotationPeriod;
    data['orbital_period'] = _orbitalPeriod;
    data['diameter'] = _diameter;
    data['climate'] = _climate;
    data['gravity'] = _gravity;
    data['terrain'] = _terrain;
    data['surface_water'] = _surfaceWater;
    data['population'] = _population;
    data['residents'] = _residents;
    data['films'] = _films;
    data['created'] = _created;
    data['edited'] = _edited;
    data['url'] = _url;
    return data;
  }
}
