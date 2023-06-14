import 'dart:convert';
import 'dart:io';

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
  await saveData(result);
  print('Data has been added to the file...');
}

Future<void> saveData(dynamic data) async{
  final File file = File('data2.txt');
  int length = 0;
  if(!(await file.exists())){
    file.create();
  }else{
    final List<String> lines = await file.readAsLines();
    length = lines.length;
  }
  for(var joke in data){
    await file.writeAsString('${++length}. ${joke['joke']}\n', mode: FileMode.writeOnlyAppend);
  }
}