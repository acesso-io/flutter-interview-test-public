class ResultInformation {
  int? count;
  int? pages;
  String? nextUrl;
  String? prevUrl;

  ResultInformation({
    this.count,
    this.pages,
    this.nextUrl,
    this.prevUrl,
  });

  static ResultInformation fromJson(dynamic json) => ResultInformation(
        count: json['count'],
        pages: json['pages'],
        nextUrl: json['next'],
        prevUrl: json['prev'],
      );
}
