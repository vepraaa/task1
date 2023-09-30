import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final url = Uri.https(
    'dummyjson.com',
    '/products',
  );
  final response = await http.get(url);

  if (response.statusCode != 200) {
    print('Error');
    return;
  }
  
  Map<String,dynamic> jsonData = convert.jsonDecode(response.body);
  List<dynamic> products = jsonData["products"];
  int sum = 0;

    double totalRating = 0;
    for (var product in products) {
      totalRating += product['rating'];
    }

    double averageRating = totalRating / products.length;

    print('Средний рейтинг: $averageRating');
}
