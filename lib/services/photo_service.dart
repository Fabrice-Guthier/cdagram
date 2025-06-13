import 'dart:convert';
import 'package:cdagram/models/photo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

/// Récupère une liste de vraies photos aléatoires depuis l'API Unsplash.
///
/// Gère la pagination car l'API limite à 30 photos par appel.
///
/// @param desiredCount Le nombre total de photos souhaitées.
/// @return Un Future qui se résoudra en une liste d'objets [Photo].
Future<List<Photo>> fetchRealRandomPhotos({int desiredCount = 100}) async {
  // REMPLACE PAR TA VRAIE CLÉ API UNSPLASH
  final String? unsplashApiKey = dotenv.env['UNSPLASH_API_KEY'];

  if (unsplashApiKey == dotenv.env['UNSPLASH_API_KEY']) {
    throw Exception('Erreur : Tu dois renseigner ta clé API Unsplash !');
  }

  final List<Photo> allPhotos = [];
  const int maxCountPerRequest = 30;
  int requestsNeeded = (desiredCount / maxCountPerRequest)
      .ceil(); // Calcule le nombre d'appels nécessaires

  for (int i = 0; i < requestsNeeded; i++) {
    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos/random?count=$maxCountPerRequest&client_id=$unsplashApiKey',
      ),
    );

    if (response.statusCode == 200) {
      // Le retour est une liste de JSON
      final List<dynamic> jsonList = jsonDecode(response.body);
      // On parse chaque objet JSON en objet Photo et on l'ajoute à notre liste
      allPhotos.addAll(
        jsonList
            .map((jsonItem) => Photo.fromJson(jsonItem as Map<String, dynamic>))
            .toList(),
      );
    } else {
      // Si une seule requête échoue, on arrête tout.
      throw Exception(
        'Échec du chargement des photos depuis Unsplash. Code: ${response.statusCode}',
      );
    }
  }

  // On retourne la liste complète (qui peut en contenir un peu plus que `desiredCount`)
  return allPhotos.take(desiredCount).toList();
}
