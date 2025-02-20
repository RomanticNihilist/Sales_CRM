import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {
  final String restUrl = "https://ikoncloud-dev.keross.com/rest";

  // Observables
  var tempTicket = ''.obs;
  var ticket = ''.obs;
  var softwareId = ''.obs;

  final String _globalAccountId = 'b8bbe5c9-ad0d-4874-b563-275a86e4b818';
  final String _softwareName = "Document Management";
  final String _versionNumber = "1";

  // Hashes password using SHA-512
  Future<String> _hashPassword(String content) async {
    final bytes = utf8.encode(content);
    final digest = sha512.convert(bytes);
    return digest.toString();
  }

  // Login API
  Future<bool> login(String username, String password) async {
    try {
      final hashedPassword = await _hashPassword(password);

      final headers = {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
      };

      final params = {
        "inZip": "false",
        "outZip": "true",
        "inFormat": "xml",
        "outFormat": "typedjson",
        "service": "loginService",
        "operation": "login",
        "locale": "en_US",
      };

      final credential = '''
<list>
  <string>
    <content><![CDATA[$username]]></content>
  </string>
  <string>
    <content><![CDATA[$hashedPassword]]></content>
  </string>
</list>
'''
          .trim()
          .replaceAll(RegExp(r'\s+'), '');

      final uri = Uri.parse(restUrl).replace(queryParameters: params);
      final body = {'arguments': credential};

      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        final temp = responseData['value']?['temporaryTicket']?['value'];
        final tk = responseData['value']?['ticket']?['value'];

        if (temp != null && temp is String) {
          tempTicket.value = temp;
          return true;
        } else if (tk != null && tk is String) {
          ticket.value = tk;
          softwareId.value =
              await _getSoftwareId(_softwareName, _versionNumber);
          return true;
        }
      }
      return false;
    } catch (e) {
      print("Login Error: $e");
      return false;
    }
  }

  Future<String> _getSoftwareId(
      String softwareName, String versionNumber) async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    return "sample_software_id";
  }
}
