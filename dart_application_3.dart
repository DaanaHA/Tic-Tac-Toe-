import 'dart:io';

List<String> number = ['1','2','3','4','5','6','7','8','9'];
List<String> combinations=['012','048','036','147','246','258','345','678'];
bool winner= false ;
bool xturn= true;
int count=0;

void main(){
  
  makeBorder();
  getChar();
}
//it split the combinations to numbers then add it to the list nums then convert them to map then list
bool checkComp(String combination , String check){

List<int> nums= combination.split(' ').map((item){return int.parse(item);}).toList();
bool match= false;

for( final item in nums){
if (number[item] == check){
  match = false;
  break;
}
}
return match;
}


void makeBorder(){
  
//  print('  |   |  ');
  print('${number[0]} | ${number[1]} | ${number[2]}');
      print('--+---+---');
 //   print('  |   |  ');
  print('${number[3]} | ${number[4]} | ${number[5]}');
   print('--+---+---');
  //print('  |   |  ');
  print('${number[6]} | ${number[7]} | ${number[8]}');


}
///player is X or O
void checkWinner(player){
for(final item in combinations){
  bool validCombination = checkComp(item, player);
  if(validCombination == true){
    print('$player Is Win !');
    winner =true;
    break;
  }
}

}

void getChar(){
  print('chose a number  ${xturn==true ? 'X':'O' }');
  int somenumber = int.parse(stdin.readLineSync()!);
  //if the enter number between 1-9
  number[somenumber-1]= xturn ? 'X' : 'O';
  //stope the X player
  xturn = !xturn;
  count++;


  //it full
  if(count == 9){
    winner = true;
    print('Game Over');
    
  }else{
    //continue the game
    makeBorder();
    checkWinner('X');
     checkWinner('O');
  }
  if (winner == false){
getChar();  
} 
}

