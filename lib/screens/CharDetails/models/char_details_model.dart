class CharDetails {
  String _charWorldName = '';
  List<String> _charStarships = [];
  List<String> _charVehicles = [];

  CharDetails(
      {String? charWorldName,
      List<String>? charStarships,
      List<String>? charVehicles}) {
    _charWorldName = charWorldName!;
    _charStarships = charStarships!;
    _charVehicles = charVehicles!;
  }

  String? get charWorldName => _charWorldName;
  set charWorldName(String? charWorldName) => _charWorldName = charWorldName!;

  List<String> get charStarships => _charStarships;
  set charStarships(List<String>? charStarships) =>
      _charStarships = charStarships!;

  List<String> get charVehicles => _charVehicles;
  set charVehicles(List<String>? charVehicles) => _charVehicles = charVehicles!;
}
