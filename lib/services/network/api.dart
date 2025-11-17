import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wepay/services/network/service_repo.dart';

class Api {
  final baseUrl = ServerRepo().baseUrl;

  postData(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;

    // This part already encodes the Map<String, dynamic> to a JSON string
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // Get request
  Future<http.StreamedResponse> getRequest(apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    var request = http.Request('GET', Uri.parse(fullUrl));
    request.body = '''''';
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // Get request II
  Future<http.StreamedResponse> getRequest2(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(fullUrl));
    request.body = '''''';
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // Post request2
  Future<http.StreamedResponse> postRequest2(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(fullUrl));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  //  post request 1
  Future<http.StreamedResponse> postRequest(
    Map<String, dynamic> data,
    apiUrl,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(fullUrl));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  //  post request 3
  Future<http.StreamedResponse> postRequest3(
    Map<String, dynamic> data,
    apiUrl,
    token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    var request = http.Request('POST', Uri.parse(fullUrl));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // Patch request3
  Future<http.StreamedResponse> postRequest4(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(fullUrl));
    request.body = '''''';
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // Patch request
  Future<http.StreamedResponse> putRequest(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse(fullUrl));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // Patch request2
  Future<http.StreamedResponse> putRequest2(data, apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    var request = http.Request('PUT', Uri.parse(fullUrl));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // Patch request3
  Future<http.StreamedResponse> putRequest3(apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    var request = http.Request('PUT', Uri.parse(fullUrl));
    request.body = '''''';
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  Future<http.StreamedResponse> putRequest4(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse(fullUrl));
    request.body = '''''';
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  // patch request2
  putData(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.put(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.StreamedResponse> postMultiData(
    Map<String, dynamic> data,
    String filePath,
    String apiUrl,
    var token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    String fileFormat = filePath.split('.').last;
    print('File format: $fileFormat');

    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    });

    // fields
    data.forEach((key, value) {
      if (value is List) {
        for (var i = 0; i < value.length; i++) {
          request.fields['$key[$i]'] = value[i].toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    // request.fields.addAll(data.map((key, value) => MapEntry(key, value.toString())));

    // Add image file
    if (filePath != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          filePath,
          contentType: MediaType('image', fileFormat),
        ),
      );
    }
    try {
      var response = await request.send();
      return response;
    } catch (e) {
      print('Error sending request: $e');
      throw e; // Rethrow the error to handle it at the calling site
    }
  }

  Future<http.StreamedResponse> postImageData(
    String filePath,
    String apiUrl,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    String fileFormat = filePath.split('.').last;
    print('File format: $fileFormat');

    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    // Add image file
    if (filePath != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          filePath,
          contentType: MediaType('image', fileFormat),
        ),
      );
    }
    try {
      var response = await request.send();
      return response;
    } catch (e) {
      print('Error sending request: $e');
      throw e; // Rethrow the error to handle it at the calling site
    }
  }

  getData(apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
  }

  getData2(apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<http.StreamedResponse> putMultiPartData(
    Map<String, dynamic> data,
    String filePath,
    String apiUrl,
    var token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    String fileFormat = filePath.split('.').last;
    print('File format: $fileFormat');

    var request = http.MultipartRequest('PUT', Uri.parse(fullUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    });
    // fields
    data.forEach((key, value) {
      if (value is List) {
        for (var i = 0; i < value.length; i++) {
          request.fields['$key[$i]'] = value[i].toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });
    // request.fields.addAll(data.map((key, value) => MapEntry(key, value.toString())));
    // Add image file
    if (filePath != '') {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          filePath,
          contentType: MediaType('image', fileFormat),
        ),
      );
    }
    try {
      var response = await request.send();
      return response;
    } catch (e) {
      print('Error sending request: $e');
      throw e; // Rethrow the error to handle it at the calling site
    }
  }

  Future<http.StreamedResponse> postMultiPart(
    List<XFile> images,
    String apiUrl,
    var token,
    Map<String, dynamic> data,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    // String fileFormat = filePath.split('.').last;
    // print('File format: $fileFormat');

    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    });
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        String fileFormat = images[i].path.split('.').last;
        log('$fileFormat');
        final f = await http.MultipartFile.fromPath(
          'images',
          images[i].path,
          contentType: MediaType('images', fileFormat),
        );
        print(f);
        request.files.add(f);
      }
    }
    request.fields.addAll(
      data.map((key, value) => MapEntry(key, value.toString())),
    );
    try {
      var response = await request.send();
      return response;
    } catch (e) {
      print('Error sending request: $e');
      throw e; // Rethrow the error to handle it at the calling site
    }
  }

  postData2(data, apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // Post Multiple Imagess
  Future<http.StreamedResponse> uploadMultipleImages(
    List<String> imagePaths,
    String apiUrl,
    String token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    // Create the multipart request
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));
    // Set the headers for the request
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    });
    // Add image files to the request
    for (String imagePath in imagePaths) {
      String fileFormat = imagePath.split('.').last;
      final file = await http.MultipartFile.fromPath(
        'files', // This should match the parameter expected by your server
        imagePath,
        contentType: MediaType('image', fileFormat), // Specify the media type
      );
      request.files.add(file);
    }
    // Send the request and return the response
    var response = await request.send();
    return response;
  }

  // images 2
  Future<http.StreamedResponse> uploadMultipleImages2(
    List<XFile> images,
    String apiUrl,
    String token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    // Create the multipart request
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));
    // Set the headers for the request
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    });
    // Add image files to the request
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        String fileFormat = images[i].path.split('.').last;
        log('$fileFormat');
        final f = await http.MultipartFile.fromPath(
          'files',
          images[i].path,
          contentType: MediaType('images', fileFormat),
        );
        print(f);
        request.files.add(f);
      }
    }
    // Send the request and return the response
    var response = await request.send();
    return response;
  }

  // upload single image
  Future<http.StreamedResponse> uploadSingleImages(
    File image,
    String apiUrl,
    String token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    // Create the multipart request
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));
    // Set the headers for the request
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    });

    // Add image file to the request
    String fileFormat = image.path.split('.').last;
    log('$fileFormat');
    final f = await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType('file', fileFormat),
    );
    print(f);
    request.files.add(f);

    // Send the request and return the response
    var response = await request.send();
    return response;
  }

  // patch media
  Future<http.StreamedResponse> putUploadMedia(
    List<String> mediaUrls,
    String apiUrl,
    String token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('PUT', Uri.parse(fullUrl));
    // Prepare the body with the media URLs
    request.body = json.encode({"media": mediaUrls});
    // Add headers to the request
    request.headers.addAll(headers);
    // Send the request and return the response
    var response = await request.send();
    return response;
  }

  Future<http.StreamedResponse> deleteRequest(apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    var request = http.Request('DELETE', Uri.parse(fullUrl));
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  Future<http.StreamedResponse> deleteRequest2(
    Map<String, dynamic> data,
    apiUrl,
    token,
  ) async {
    var fullUrl = baseUrl + apiUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    var request = http.Request('DELETE', Uri.parse(fullUrl));
    request.headers.addAll(headers);
    request.body = jsonEncode(data);
    var response = await request.send();
    return response;
  }

  _setHeaders() => {'Content-type': 'application/json'};
}

/*
repass android -keypass android
Alias name: androiddebugkey
Creation date: Jun 30, 2023
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Fri Jun 30 14:53:10 WAT 2023 until: Sun Jun 22 14:53:10 WAT 2053
Certificate fingerprints:
         SHA1: A1:34:39:A4:AA:E2:B0:79:35:68:FE:84:1C:7B:3A:EB:81:83:36:2E
         SHA256: DB:70:C1:03:28:B2:E6:2B:72:A1:91:39:97:1D:8F:2C:2A:9F:DF:91:D7:42:7A:4C:F6:44:A6:57:F5:57:67:D2
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1
 */
