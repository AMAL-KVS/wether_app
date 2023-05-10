import 'package:http/http.dart' as http;

class NetWorkHelper {
  final String url;

  NetWorkHelper({required this.url});
  Future<String> getWether() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return '';
    }
    final body = response.body;
    return body;
  }
}
