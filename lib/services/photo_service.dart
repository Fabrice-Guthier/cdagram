import 'package:cdagram/models/photo.dart';
import 'package:faker/faker.dart';

List<Photo> generatePhotos({int count = 100}) {
  // On invoque notre PNJ "faker"
  final faker = Faker();

  // List.generate est un constructeur puissant pour créer des listes à la volée.
  return List.generate(count, (index) {
    // Pour la cohérence des données, on s'assure que la date de mise à jour
    // est toujours après la date de création.
    final creationDate = faker.date.dateTime(minYear: 2020, maxYear: 2024);

    return Photo(
      // --- Attributs d'Identification ---
      id: faker.guid.guid(), // Génère un ID unique de type GUID
      createdAt: creationDate,
      updatedAt: faker.date.dateTime(minYear: creationDate.year, maxYear: 2025),

      // --- Attributs Visuels ---
      width: faker.randomGenerator.integer(4000, min: 1000),
      height: faker.randomGenerator.integer(3000, min: 800),
      color: '#${faker.randomGenerator.integer(0xFFFFFF).toRadixString(16).padLeft(6, '0')}',
      // --- Statistiques de "Popularité" ---
      likes: faker.randomGenerator.integer(5000),
      downloads: faker.randomGenerator.integer(50000, min: 500),

      // --- Attributs Descriptifs ---
      description: faker.lorem.sentence(), // Le "lore" de l'objet
      author: faker.person.name(), // Le nom du "crafter"
      // On utilise un service d'images placeholder pour avoir de vraies images
      // Le "seed" garantit une image différente à chaque fois.
      url:
          'https://picsum.photos/seed/${faker.randomGenerator.string(10, min: 5)}/400/600',
    );
  });
}
