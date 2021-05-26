import 'package:flutter/material.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/presentation/base/base_scaffold.dart';
import 'package:flutter_interview_test/presentation/base/section_widget.dart';
import 'package:flutter_interview_test/presentation/base/status_widget.dart';

class CharacterDetailsView extends StatelessWidget {
  final Character character;

  CharacterDetailsView(this.character);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: character.name,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            if (character.imageUrl != null) ...[
              Image.network(
                character.imageUrl!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ],
            StatusWidget(status: character.status),
            SectionWidget(
              hint: 'Origin',
              label: character.origin?.name,
            ),
            SectionWidget(
              hint: 'Last known location',
              label: character.location?.name,
            ),
            SectionWidget(hint: 'Gender', label: character.gender),
            SectionWidget(hint: 'Species', label: character.species),
            SectionWidget(hint: 'Type', label: character.type),
          ],
        ),
      ),
    );
  }
}
