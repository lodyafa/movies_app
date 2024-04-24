import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/person_details_widgets/person_details_name.dart';
import 'package:movies_app/ui/widgets/person_details_widgets/person_extra_info.dart';

class PersonDetailsLoadedBody extends StatelessWidget {
  const PersonDetailsLoadedBody({
    super.key,
    required this.person,
  });

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ImageFormatter.formatImageWidget(
                  context,
                  imagePath: person.profilePath,
                  height: 210,
                  width: 140,
                ),
                Expanded(
                  child: PersonDetailsName(
                    personName: person.name,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PersonExtraInfo(
              biography: person.biography,
              birthday: person.birthday,
              placeOfBirth: person.placeOfBirth,
            ),
          )
        ],
      ),
    );
  }
}
