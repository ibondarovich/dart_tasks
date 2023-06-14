void main(List<String> args) {
  var nums = [10,9,2,5,3,7,101,18];
  print(getLength(nums));
}

int getLength(List<int> nums){
  if(nums.length < 1 || nums.length > 2500){
    return -1;
  }
  var check = nums.where((element)=> element >104 || element < -104);
  if(check.isNotEmpty){
    return -1;
  }
  var resultList = <int>[];
  resultList.add(nums[0]);
  var length = nums.length;
  for(int i = 1; i < length; i++){
   if(resultList[resultList.length - 1] < nums[i]){
    resultList.add(nums[i]);
   }
   else{
    var position = binarySearch(nums[i], resultList);
    resultList[position] = nums[i];
   }
  }

  return resultList.length;
}

int binarySearch(int number, List<int> list){
  var left = 0, right = list.length - 1;
  while(left <= right){
    var mid = ((left + right)/2).floor();
    if(list[mid] < number){
      left = mid + 1;
    }else{
      right = mid - 1;
    }
  }
  return left;
}