void main(List<String> args) async{
  Stream<int> res = generateValues(5);
  await for(var value in res){
    print(value);
  }
}

Stream<int> generateValues(int length) async*{
  for(int i = 0; i < length; i++){
    yield i;
  }
}