void main(List<String> args) async{
  final int? number = int.tryParse(args.first);
  if(number == null) {
    print('Incorrect value!');
    return;
  }
  Stream<int> res = generetor(number);
  await for(var value in res){
    print(value);
  }
}
Stream<int> generetor(int length) async*{
  if(length > 0){
    yield(length - 1);
    yield* generetor(length - 1);
  }
}