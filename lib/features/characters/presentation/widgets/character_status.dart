import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CharacterStatusType { status, gender }

class CharacterStatus extends StatelessWidget {
  final Map<CharacterStatusType, Map<String, Map<String, dynamic>>>
      _characterStatusTypeToStyle = {
    CharacterStatusType.status: {
      'ALIVE': {
        'color': Colors.greenAccent,
        'icon': const Icon(
          Icons.person,
          color: Colors.greenAccent,
          size: 16,
        ),
      },
      'DEAD': {
        'color': Colors.redAccent,
        'icon': SvgPicture.asset(
          'lib/assets/icons/dead.svg',
          colorFilter:
              const ColorFilter.mode(Colors.redAccent, BlendMode.srcIn),
          width: 16,
          height: 16,
        ),
      },
      'UNKNOWN': {
        'color': Colors.grey,
        'icon': const Icon(
          Icons.question_mark,
          color: Colors.grey,
          size: 16,
        ),
      },
    },
    CharacterStatusType.gender: {
      'MALE': {
        'color': Colors.blueAccent,
        'icon': const Icon(Icons.male, color: Colors.blueAccent, size: 16),
      },
      'FEMALE': {
        'color': Colors.pinkAccent,
        'icon': const Icon(Icons.female, color: Colors.pinkAccent, size: 16),
      },
      'UNKNOWN': {
        'color': Colors.grey,
        'icon': SvgPicture.asset(
          'lib/assets/icons/genderless.svg',
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          width: 20,
          height: 20,
        ),
      },
      'GENDERLESS': {
        'color': Colors.white,
        'icon': SvgPicture.asset(
          'lib/assets/icons/genderless.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 20,
          height: 20,
        ),
      }
    }
  };

  CharacterStatus({
    super.key,
    required this.characterText,
    required this.characterStatusType,
  });

  final String characterText;
  final CharacterStatusType characterStatusType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _characterStatusTypeToStyle[characterStatusType]![
              characterText.toUpperCase()]!['color'],
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _characterStatusTypeToStyle[characterStatusType]![
              characterText.toUpperCase()]!['icon'],
          const SizedBox(width: 5),
          Text(
            characterText,
            style: TextStyle(
              fontSize: 14,
              color: _characterStatusTypeToStyle[characterStatusType]![
                  characterText.toUpperCase()]!['color'],
            ),
          ),
        ],
      ),
    );
  }
}
