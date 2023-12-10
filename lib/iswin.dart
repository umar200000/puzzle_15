bool isWin(List<int> list){
  int a = 0;
  for(int i=0; i<list.length-1; i++){
    if(i+1!=list[i]) a++;
  }
  return a==0;
}