import 'dart:convert';
import 'package:http/http.dart';
import '../model/post_model.dart';
import 'log_service.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    LogService.d("Api: " + BASE + api);
    LogService.w("Params: " + params.toString());
    LogService.i("Respone: " + response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    LogService.d(response.body);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    LogService.d(response.body);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    LogService.d("Api: " + BASE + api);
    LogService.w("Params: " + params.toString());
    LogService.i("Respone: " + response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Apis */

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      "id": post.id.toString(),
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  /* Http Parsing */

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}