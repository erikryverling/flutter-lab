class Coffee {
  final String name;
  final String roaster;
  final String origin;
  final String region;

  const Coffee({
    required this.name,
    required this.roaster,
    required this.origin,
    required this.region,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {

    String name = json['name'];
    String roaster = json['roaster'];
    String origin = json['origin'];
    String region = json['region'];

    return Coffee(
      name: name,
      roaster: roaster,
      origin: origin,
      region: region,
    );
  }
}