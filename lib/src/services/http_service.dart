import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response?> get(String path) async {
    http.Response response =
        await http.get(Uri.parse(path));
    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }
}
