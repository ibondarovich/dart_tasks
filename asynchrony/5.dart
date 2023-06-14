import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async{
  if(args.isEmpty){
    print('No arguments are provided!');
    return;
  }
  String dirName = args.first;
  Directory dirNode = Directory(dirName);
  await for(var node in dirNode.list()){
    if(node is File){
      ReceivePort receivePort = ReceivePort();
      Isolate currIsolate = await Isolate.spawn(
        callback,
        [receivePort.sendPort, node],
      );
      receivePort.listen((message) { if(message as bool == true){
        receivePort.close();
        currIsolate.kill(priority: Isolate.immediate);
      }});
    }
  }
}

void callback(List<Object> args) async{
  SendPort resultPort = args[0] as SendPort;
  FileSystemEntity file = args[1] as FileSystemEntity;
  FileStat fstat = await file.stat();
  print('${file.path} ${fstat.size} bytes' + '\n');
  resultPort.send(true);
}