import 'package:flutter/material.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character charaterDetails;
  const CharacterDetailsScreen({super.key, required this.charaterDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(charaterDetails.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/Background_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Image
                Positioned(
                  bottom: -80,
                  left: MediaQuery.of(context).size.width / 2 - 80,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(charaterDetails.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100), // Space for profile image overlap
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Character Name
                  Center(
                    child: Text(
                      charaterDetails.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Character Status
                  Center(
                    child: Text(
                      charaterDetails.status.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: charaterDetails.status == "Alive"
                            ? Colors.green
                            : charaterDetails.status == "Dead"
                                ? Colors.red
                                : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // About Section
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Species: ${charaterDetails.species}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Gender: ${charaterDetails.gender}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Origin: ${charaterDetails.origin.name}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Location: ${charaterDetails.location.name}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Map Section
                  const Text(
                    "Last Seen Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
