import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/base/base_state.dart';
import 'package:flutter_interview_test/core/base/view_state.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/use_cases/get_all_characters_use_case.dart';
import 'package:flutter_interview_test/presentation/base/base_scaffold.dart';
import 'package:flutter_interview_test/presentation/base/load_more_view.dart';
import 'package:flutter_interview_test/presentation/base/loading_view.dart';
import 'package:flutter_interview_test/presentation/character_card/character_card_view.dart';

class CharacterListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CharacterListState();
}

class _CharacterListState extends BaseState<CharacterListView> {
  List<Character> characters = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    _initialFetchCharacters();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        title: 'Characters',
        body: _getBody(),
      );

  Widget _getBody() {
    if (state.isBusy) {
      return LoadingView();
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemBuilder: (_, int index) => (index == characters.length - 1)
          ? _showLoadMore()
          : CharacterCardView(character: characters[index]),
      itemCount: characters.length,
    );
  }

  Widget _showLoadMore() {
    if (state.isLoadMore) {
      return LoadingView();
    }
    return LoadMoreView(
      onPressed: _loadMoreCharacteres,
    );
  }

  void _initialFetchCharacters() async {
    setState(() {
      state = BusyState();
    });
    await _fetchCharacters();
  }

  void _loadMoreCharacteres() async {
    setState(() {
      state = LoadMoreState();
      page += 1;
    });
    await _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    final result = await GetAllCharacters(page).run();
    setState(() {
      if (result.isSuccess && result.data?.results != null) {
        characters.addAll([...?result.data?.results]);
      }
      state = IdleState(hasError: !result.isSuccess);
    });
  }
}
