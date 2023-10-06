part of 'repo.dart';

class ApiDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<ResponseAuth> signIn(RequestLogin request) async {
    var response = await http.post(
      Uri.parse('http://192.168.1.7:8000/api/login'),
      headers: {'accept': 'application/json'},
      body: request.toMap(),
    );
    var body = jsonDecode(response.body);
    return ResponseAuth.fromJson(body);
  }

  Future<ApiResponse> login(RequestLogin request) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(Uri.parse('http://192.168.1.7:8000/api/login'),
          headers: {'Accept': 'application/json'}, body: request.toMap());

      switch (response.statusCode) {
        case 200:
          apiResponse.data = ResponseAuth.fromJson(jsonDecode(response.body));
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        default:
          apiResponse.error = "somethingWentWrong";
          break;
      }
    } catch (e) {
      apiResponse.error = "serverError";
    }

    return apiResponse;
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'access_token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persisToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'access_token');
    storage.deleteAll();
  }
}
