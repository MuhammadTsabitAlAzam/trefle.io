class PlantSpecies {
  final int id;
  final String? commonName;
  final String? imageUrl;
  final String? detail;

  PlantSpecies({
    required this.id,
    this.commonName,
    this.imageUrl,
    this.detail
  });

  factory PlantSpecies.fromJson(Map<String, dynamic> json) {
    return PlantSpecies(
      id: json['id'],
      commonName: json['common_name'] ?? 'Unknown',
      imageUrl: json['image_url'] ?? null,
      detail: json['links']['self'] ?? null
    );
  }
}

class PlantDetail {
  final int id;
  final String commonName;
  final String scientificName;
  final String imageUrl;
  final bool edible;
  final String genus;
  final String family;
  final List<PlantImage> leafImages;
  final List<PlantImage> barkImages;
  final List<PlantImage> habitImages;
  final List<PlantImage> fruitImages;
  final List<PlantDistribution> natives;
  final List<String> synonyms;
  final List<String>? edibleParts;

  PlantDetail({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.imageUrl,
    required this.genus,
    required this.edible,
    required this.family,
    required this.leafImages,
    required this.barkImages,
    required this.habitImages,
    required this.fruitImages,
    required this.natives,
    required this.synonyms,
    this.edibleParts,
  });

  factory PlantDetail.fromJson(Map<String, dynamic> json) {
    return PlantDetail(
      id: json['id'],
      commonName: json['common_name'] ?? '-',
      scientificName: json['scientific_name'] ?? '-',
      imageUrl: json['image_url'] ?? '-',
      edible: json['edible'],
      genus: json['genus'] ?? '-',
      family: json['family'] ?? '-',
      leafImages: (json['images']['leaf'] as List<dynamic>).map((image) => PlantImage.fromJson(image)).toList(),
      barkImages: (json['images']['bark'] as List<dynamic>).map((image) => PlantImage.fromJson(image)).toList(),
      habitImages: (json['images']['habit'] as List<dynamic>).map((image) => PlantImage.fromJson(image)).toList(),
      fruitImages: (json['images']['fruit'] as List<dynamic>).map((image) => PlantImage.fromJson(image)).toList(),
      natives: (json['distributions']['native'] as List<dynamic>).map((native) => PlantDistribution.fromJson(native)).toList(),
      synonyms: (json['synonyms'] as List<dynamic>).map((synonym) => synonym['name'] as String).toList(),
      edibleParts: (json['edible_part'] as List<dynamic>?)?.map((part) => part as String).toList(),
    );
  }
}

class PlantImage {
  final int id;
  final String imageUrl;
  final String copyright;

  PlantImage({
    required this.id,
    required this.imageUrl,
    required this.copyright,
  });

  factory PlantImage.fromJson(Map<String, dynamic> json) {
    return PlantImage(
      id: json['id'],
      imageUrl: json['image_url'],
      copyright: json['copyright'],
    );
  }
}

class PlantDistribution {
  final int id;
  final String name;

  PlantDistribution({
    required this.id,
    required this.name,
  });

  factory PlantDistribution.fromJson(Map<String, dynamic> json) {
    return PlantDistribution(
      id: json['id'],
      name: json['name'],
    );
  }
}

