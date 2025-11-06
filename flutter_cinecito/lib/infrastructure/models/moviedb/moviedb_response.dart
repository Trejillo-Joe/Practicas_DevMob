class MoviedbResponse {
  final int page;
  final Dates? dates;
  final int totalResults;

  MoviedbResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
