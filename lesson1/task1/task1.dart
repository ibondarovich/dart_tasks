import 'dart:math';

void main(List<String> args) {
  var coins= [2,1];
  var amount = 3;
  var result = getNumberOfCoins(coins, amount);
  print(result);
}

int getNumberOfCoins(List<int> coins, int amount){
  if (coins.isEmpty || amount < 0 || amount > 104) {
    return -1;
  }
  if (coins.length > 12) {
    return -1;
  }
  var contain = coins.where((element) => element < 1 || element > 230);
  if (contain.isNotEmpty) {
    return -1;
  }

  return getResult(coins, amount, 0);
}

int getResult(List<int> coins, int amount, int coinIndex){
  var minValue = amount + 1;
  if(amount == 0){
    return 0;
  }

  if(coinIndex < coins.length && amount > 0){
    for(int i = 0; i < amount; i++){
      if(coins[coinIndex] * i <= amount){
        var res = getResult(coins, amount - coins[coinIndex]*i, coinIndex + 1);
        if(res != -1){         
          minValue = min(minValue, res + i);
        }
      }
    }
  }
  return minValue == amount + 1? -1: minValue; 
}