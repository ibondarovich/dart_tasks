void main(List<String> args) {
  var nums = [-2,1,-3,4,-1,2,1,-5,4];
  var result = getMaxSum(nums);
  print(result);
}

int getMaxSum(List<int> nums){
  var sumResult = 0;
  var temp = nums[0];
  for (int i = 1; i < nums.length; i++){
    temp += nums[i];
    if(sumResult < temp){
      sumResult = temp;
    }
    if(temp > nums[i]){
      temp = 0;
    }
  }
  return sumResult;
}