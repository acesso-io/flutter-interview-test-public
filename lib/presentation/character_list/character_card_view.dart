import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/colors.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/use_cases/get_favorite_character.dart';
import 'package:flutter_interview_test/domain/use_cases/save_favorite_character.dart';
import 'package:flutter_interview_test/presentation/base/section_widget.dart';
import 'package:flutter_interview_test/presentation/base/status_widget.dart';
import 'package:flutter_interview_test/presentation/character_details/character_details_view.dart';

class CharacterCardView extends StatefulWidget {
  final Character character;

  const CharacterCardView({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<CharacterCardView> createState() => _CharacterCardViewState();
}

class _CharacterCardViewState extends State<CharacterCardView> {
  final double _height = 150.0;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _getFavorite(widget.character.id?? 0);
  }

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CharacterDetailsView(widget.character),
      ),
    ),
    child: Container(
      height: _height,
      child: Card(
        elevation: 2,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: AppColors.elavatedItemColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.character.imageUrl != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.character.imageUrl!,
                  fit: BoxFit.cover,
                  width: _height,
                  height: _height,
                ),
              ),
              SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.character.name ?? '',
                          style: Styles.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _tapFavorite(widget.character),
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                          isFavorite ? Colors.redAccent : Colors.grey,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                  StatusWidget(status: widget.character.status),
                  SectionWidget(
                    hint: 'Species:',
                    label: widget.character.species ?? '',
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    ),
  );

  void _tapFavorite(Character character) async {
    await SaveFavoriteCharacter(id: character.id ?? 0).run(isFavorite);
    _getFavorite(character.id?? 0);
    setState(() {});
  }

  void _getFavorite(int id) async {
    isFavorite = await GetFavoriteCharacter(id: id).run();
    setState(() {});
  }
}
