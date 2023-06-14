void main(List<String> args) {
  final int numCourses = 5;
  final List<List<int>> prerequisites =[[1,0],[2,1],[3,4],[1,3]];
  final bool result = canFinish(numCourses, prerequisites);
  print(result);
}

bool canFinish(int numCourses, List<List<int>> prerequisites) {    
  if(!checkConstraints(numCourses, prerequisites)) return false;

  final int length = prerequisites.length;
  List<int> colors = List.generate(numCourses, (index) => -1);
  List<List<int>> list = List.generate(numCourses,
    (i) => <int>[],
    growable: false);
  for(int i = 0; i < length; i++){
    if(prerequisites[i][0] == prerequisites[i][1]) return false;
    list[prerequisites[i][0]].add(prerequisites[i][1]);
    colors[prerequisites[i][0]] = 0;
  }
  for(int i = 0; i < numCourses; i++){
    final bool res = hasCycleDependecy(list,colors, i);
    if(res == true) return false;
  }
  final List<List<int>> temp = list.where((element) => 
    element.isNotEmpty).toList();
  return temp.length <= numCourses;                                                               
}

bool hasCycleDependecy(List<List<int>> list, List<int> colors, int index){
  if(colors[index] == -1){
    colors[index] = 2;
  }
  if(colors[index] == 1) return true;
  if(colors[index] == 2) return false;
  colors[index] = 1;
  
  for(int i = 0; i < list[index].length; i++){
    final bool res = hasCycleDependecy(list, colors, list[index][i]);
    if(res == true) return true;
  }
  colors[index] = 2;
  return false;
}

bool checkConstraints(int numCourses, List<List<int>> prerequisites){
  if(numCourses < 0 || numCourses > 2000) return false;
  if(prerequisites.length < 0 || prerequisites.length > 5000) return false;
  List<List<int>> check = prerequisites.where((element) => 
    element.length != 2).toList();
  if(check.isNotEmpty) return false;

  check = prerequisites.where((element){
    if(element[0] < 0 || element[0] >= numCourses) return true;
    if(element[1] < 0 || element[1] >= numCourses) return true;
    return false;
  }).toList();
  if(check.isNotEmpty) return false;

  return true;
}