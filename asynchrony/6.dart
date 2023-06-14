import 'dart:convert';

import 'package:http/http.dart' as http;
void main(List<String> args) async{
  if(args.isEmpty){
    print('No arguments are provided!');
    return;
  }
  final String link = 'https://api.api-ninjas.com/v1/jokes?limit=${args.first}';
  final response = await http.get(Uri.parse(link),  headers: {
    'X-Api-Key': 'Vh/jbiQp+nLmT7GG1DDuUQ==xOJVYKAzyxSO32Gp'
  },);
  final result = jsonDecode(response.body);
  for(var joke in result){
    print(joke['joke']);
  }
}