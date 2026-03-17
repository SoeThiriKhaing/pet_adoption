class PetEntity {
  final String id;
  final String name;
  final String category;
  final String breed;
  final int age;
  final String imageUrl;
  final DateTime? createdAt;

  PetEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.breed,
    required this.age,
    required this.imageUrl,
    required this.createdAt,
  });

}

