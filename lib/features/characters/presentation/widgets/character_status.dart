import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CharacterStatusType { status, gender }

class CharacterStatus extends StatelessWidget {
  late final Map<CharacterStatusType, Map<String, Map<String, dynamic>>>
      _characterStatusTypeToStyle;

  CharacterStatus({
    super.key,
    required this.characterText,
    required this.characterStatusType,
    this.scale = 1.0,
  }) {
    _characterStatusTypeToStyle = {
    CharacterStatusType.status: {
      'ALIVE': {
        'color': Colors.greenAccent,
        'icon': Icon(
          Icons.person,
          color: Colors.greenAccent,
          size: 16 * scale,
        ),
      },
      'DEAD': {
        'color': Colors.redAccent,
        'icon': SvgPicture.asset(
          'lib/assets/icons/dead.svg',
          colorFilter:
              const ColorFilter.mode(Colors.redAccent, BlendMode.srcIn),
          width: 16 * scale,
          height: 16 * scale,
        ),
      },
      'UNKNOWN': {
        'color': Colors.grey,
        'icon': Icon(
          Icons.question_mark,
          color: Colors.grey,
          size: 16 * scale,
        ),
      },
    },
    CharacterStatusType.gender: {
      'MALE': {
        'color': Colors.blueAccent,
        'icon': Icon(Icons.male, color: Colors.blueAccent, size: 16 * scale),
      },
      'FEMALE': {
        'color': Colors.pinkAccent,
        'icon': Icon(Icons.female, color: Colors.pinkAccent, size: 16 * scale),
      },
      'UNKNOWN': {
        'color': Colors.grey,
        'icon': SvgPicture.asset(
          'lib/assets/icons/genderless.svg',
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          width: 20 * scale,
          height: 20 * scale,
        ),
      },
      'GENDERLESS': {
        'color': Colors.white,
        'icon': SvgPicture.asset(
          'lib/assets/icons/genderless.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 20 * scale,
          height: 20 * scale,
        ),
      }
    }
  };
  }

  final String characterText;
  final CharacterStatusType characterStatusType;
  final double scale;

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
          (_characterStatusTypeToStyle[characterStatusType]![
              characterText.toUpperCase()]!['icon']),
          const SizedBox(width: 5),
          Text(
            characterText,
            style: TextStyle(
              fontSize: 14 * scale,
              color: _characterStatusTypeToStyle[characterStatusType]![
                  characterText.toUpperCase()]!['color'],
            ),
          ),
        ],
      ),
    );
  }
}
