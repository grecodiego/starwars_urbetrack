class VehiclesModel {
  String? cargoCapacity;
  String? consumables;
  String? costInCredits;
  String? created;
  String? crew;
  String? edited;
  String? length;
  String? manufacturer;
  String? maxAtmospheringSpeed;
  String? model;
  String? name;
  String? passengers;
  List<String>? films;
  String? url;
  String? vehicleClass;

  VehiclesModel(
      {this.cargoCapacity,
      this.consumables,
      this.costInCredits,
      this.created,
      this.crew,
      this.edited,
      this.length,
      this.manufacturer,
      this.maxAtmospheringSpeed,
      this.model,
      this.name,
      this.passengers,
      this.films,
      this.url,
      this.vehicleClass});

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    cargoCapacity = json['cargo_capacity'];
    consumables = json['consumables'];
    costInCredits = json['cost_in_credits'];
    created = json['created'];
    crew = json['crew'];
    edited = json['edited'];
    length = json['length'];
    manufacturer = json['manufacturer'];
    maxAtmospheringSpeed = json['max_atmosphering_speed'];
    model = json['model'];
    name = json['name'];
    passengers = json['passengers'];
    films = json['films'].cast<String>();
    url = json['url'];
    vehicleClass = json['vehicle_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cargo_capacity'] = this.cargoCapacity;
    data['consumables'] = this.consumables;
    data['cost_in_credits'] = this.costInCredits;
    data['created'] = this.created;
    data['crew'] = this.crew;
    data['edited'] = this.edited;
    data['length'] = this.length;
    data['manufacturer'] = this.manufacturer;
    data['max_atmosphering_speed'] = this.maxAtmospheringSpeed;
    data['model'] = this.model;
    data['name'] = this.name;
    data['passengers'] = this.passengers;
    data['films'] = this.films;
    data['url'] = this.url;
    data['vehicle_class'] = this.vehicleClass;
    return data;
  }
}
