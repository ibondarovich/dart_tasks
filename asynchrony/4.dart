import 'dart:convert';
import 'dart:io';

void main(List<String> args) async{
  String fileName =args.first;
  File file = File(fileName);
  if(await file.exists()){
    Stream<String> fileStream = file.openRead().transform(utf8.decoder).transform(LineSplitter());
    await for(var data in fileStream){
      print(data);
    }
  }else{
    print('There is no such file..');
  }
}