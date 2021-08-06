import 'package:ne_kidaem_test/domain/network/url_config.dart';

class UriBuilder {
  final String _host = URL;

  UriBuilder();

  Uri withoutParams(String path) => Uri.https(_host, path);
}