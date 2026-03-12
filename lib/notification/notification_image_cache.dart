import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';

class NotificationImageCache {
  static Future<String> _loadDirectory() async {
    return "${(await getApplicationDocumentsDirectory()).path}/noti_img_cache";
  }

  static Future<String?> getCachedFile(String? url) async {
    if(url == null) return null;
    final bytes = utf8.encode(url);
    final digest = sha256.convert(bytes);
    final res = await http.get(Uri.parse(url));
    if(res.statusCode != 200) return null;
    final splitted = url.split('.');
    final extension = splitted.isEmpty || splitted.last.isEmpty ? 'jpg' : splitted.last;
    final path = '${await _loadDirectory()}$digest.$extension';
    final file = File(path);
    await file.create(recursive: true);
    await file.writeAsBytes(res.bodyBytes);
    return path;
  }
}