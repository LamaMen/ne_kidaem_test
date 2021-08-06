class UriBuilder {
  static const HOST = 'trello.backend.tests.nekidaem.ru';
  static const VERSION = '/api/v1';

  UriBuilder();

  Uri withoutParams(String path) => Uri.https(HOST, VERSION + path);
}
