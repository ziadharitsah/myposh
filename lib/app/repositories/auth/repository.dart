part of 'repo.dart';

class ApiDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<ResponseAuth> signIn(RequestForLogin request) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'accept': 'application/json'},
      body: request.toMap(),
    );
    var body = jsonDecode(response.body);
    return ResponseAuth.fromJson(body);
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
