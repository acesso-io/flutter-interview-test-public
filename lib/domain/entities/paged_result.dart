import 'package:flutter_interview_test/core/resources/types.dart';
import 'package:flutter_interview_test/domain/entities/result_information.dart';

class PagedResult<T> {
  ResultInformation? information;
  List<T>? results;

  PagedResult({
    this.information,
    this.results,
  });

  static PagedResult<T> fromJson<T>(
    dynamic json,
    Mapper<T> mapper,
  ) =>
      PagedResult<T>(
        information: json['info'] != null
            ? ResultInformation.fromJson(json['info'])
            : null,
        results: json['results'] != null
            ? (json['results'] as List).map((obj) => mapper(obj)).toList()
            : null,
      );
}
