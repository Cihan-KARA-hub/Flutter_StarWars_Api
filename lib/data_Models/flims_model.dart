class Film {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;

  Film({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      episodeId: json['episode_id'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
    );
  }
}
