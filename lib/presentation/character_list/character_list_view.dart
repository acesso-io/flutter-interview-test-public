import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/base/base_state.dart';
import 'package:flutter_interview_test/core/base/view_state.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/use_cases/get_all_characters_use_case.dart';
import 'package:flutter_interview_test/presentation/base/base_scaffold.dart';
import 'package:flutter_interview_test/presentation/base/error_view.dart';
import 'package:flutter_interview_test/presentation/base/loading_view.dart';
import 'package:flutter_interview_test/presentation/character_card/character_card_view.dart';

class CharacterListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CharacterListState();
}

class _CharacterListState extends BaseState<CharacterListView> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        title: 'Characters',
        body: state.isBusy
            ? LoadingView()
            : state.hasError
                ? ErrorView()
                : ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                    itemBuilder: (_, int index) =>
                        CharacterCardView(character: characters[index]),
                    itemCount: characters.length,
                  ),
      );

  void _fetchCharacters() async {
    setState(() {
      state = BusyState();
    });
    final result = await GetAllCharacters(1).run();
    setState(() {
      characters = result.data?.results ?? [];
      state = IdleState(hasError: !result.isSuccess);
    });
  }
}
