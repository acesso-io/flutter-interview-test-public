import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/colors.dart';
import 'package:flutter_interview_test/core/resources/preference.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFavorite;
  final Character character;

  const FavoriteWidget({
    Key? key,
    this.isFavorite = false,
    required this.character,
  }) : super(
          key: key,
        );

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  late bool isNewFavorite;

  @override
  void initState() {
    isNewFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Preference.setFavoriteCharacter(
          id: widget.character.id.toString(),
        ).then((value) {
          setState(() {
            isNewFavorite ? isNewFavorite = false : isNewFavorite = true;
          });
        });
      },
      color: isNewFavorite
          ? AppColors.favoriteColor
          : AppColors.favoriteColorDisable,
      icon: Icon(
        isNewFavorite ? Icons.star : Icons.star_border,
      ),
    );
  }
}
