float rotX=0,rotY=0;
int[][][] box = new int [4][4][4];
void setup() {
  size(640, 640, P3D);
  startbox();
}

void draw() {
  background(120);
  fill(255);
  line(0,0,100,100);
  translate(width / 2, height / 2, -100);
  rotateX(rotX);
  rotateY(rotY);
  
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      for(int k = 0; k < 4; k++){
        drawTextOnCube((i-2)*100+50,(j-2)*100+50,(k-2)*100+50,box[i][j][k]);
      }
    }
  }
}
void cheat(){
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      for(int k = 0; k < 4; k++){
        box[i][j][k] = 25;
      }
    }
  }

}
void startbox(){
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      for(int k = 0; k < 4; k++){
        box[i][j][k] = 0;
      }
    }
  }
}
void keyPressed(){
  
  if( key == 'd' ){ //right
    boxmove_right();
    spawnNumber();
  }
  else if( key == 'a'){//left
    boxmove_left();
    spawnNumber();
  }
  else if( keyCode == SHIFT){
    boxmove_down();
    spawnNumber();
  }
  else if( key == ' '){
    boxmove_up();
    spawnNumber();
  }
  else if( key == 'w'){
    boxmove_front();
    spawnNumber();
  }
  else if( key == 's'){
    boxmove_back();
    spawnNumber();
  }
  else if( key == 'c'){
    cheat();
    spawnNumber();
  }
  else if( key == 'r'){
    startbox();
    spawnNumber();
  }
 else if( keyCode == UP){
    rotX = rotX + 0.1;
  }
  else if( keyCode == DOWN){
    rotX = rotX - 0.1;
  }
  else if( keyCode == LEFT){
    rotY = rotY - 0.1;
  }
  else if( keyCode == RIGHT){
    rotY = rotY + 0.1;
  }
}
void drawTextOnCube(float x,float y,float z,int c) {
  float s = 50; // 立方体のサイズ
  int pow = (int)pow(2,c);
  translate(x, y, z);
  if( c == 0 )noFill();
  else if( c == 1 ) fill(238,228,218);
  else if( c == 2 ) fill(237,224,200);
  else if( c == 3 ) fill(242,177,121);
  else if( c == 4 ) fill(245,149,99);
  else if( c == 5 ) fill(246,124,96);
  else if( c == 6 ) fill(246,94,59);
  else if( c == 7 ) fill(237,207,115);
  else if( c == 8 ) fill(237,204,98);
  else if( c == 9 ) fill(237,200,80);
  else if( c == 10 ) fill(237,197,63);
  else if( c == 11 ) fill(237,194,45);
  else if( c == 12 ) fill(97,216,146);
  else if( c == 13 ) fill(39,187,102);
  else if( c == 14 ) fill(35,143,83);
  else if( c == 15 ) fill(35,141,116);
  else if( c == 16 ) fill(35,141,151);
  else if( c == 17 ) fill(35,167,182);
  else if( c == 18 ) fill(35,167,201);
  else if( c == 19 ) fill(35,141,116);
  else if( c == 20 ) fill(35,209,236);
  else if( c == 21 ) fill(35,164,234);
  else if( c == 22 ) fill(35,138,234);
  else if( c == 23 ) fill(35,114,234);
  else if( c == 24 ) fill(35,85,234);
  else if( c == 25 ) fill(51,35,234);
  else if( c == 26 ) fill(65,35,234);
  else if( c == 27 ) fill(95,25,234);
  else if( c == 28 ) fill(124,35,234);
  else if( c == 29 ) fill(144,35,234);
  else if( c >= 30 ) fill(0,0,0);
  box(s);
  textAlign(CENTER,CENTER);
  
  if( c > 0 ){ 
    if( c > 2 )fill( 249,246,242 );
    else fill(119,110,101);
    if( c < 22 ) textSize(40-(int)(log(pow)/log(10))*5);
    if( c >= 23 ) textSize(40-(int)(log(pow)/log(10))*4);
    if( c >= 27 ) textSize(40-(int)(log(pow)/log(10))*3.5);
    
    // 前面にテキストを描画
    text(pow, 0, -7, s / 2 +1 );
  
    // 後面にテキストを描画
    pushMatrix();
    rotateY(PI);
    text(pow, 0, -7, s / 2 + 1);
    popMatrix();
  
    // 左側面にテキストを描画
    pushMatrix();
    rotateY(HALF_PI);
    text(pow, 0, -7, s / 2 + 1);
    popMatrix();
  
    // 右側面にテキストを描画
    pushMatrix();
    rotateY(-HALF_PI);
    text(pow, 0, -7, s / 2 + 1);
    popMatrix();
  
    // 上側面にテキストを描画
    pushMatrix();
    rotateX(HALF_PI);
    text(pow, 0, -7, s / 2 + 1);
    popMatrix();
  
    // 下側面にテキストを描画
    pushMatrix();
    rotateX(-HALF_PI);
    text(pow, 0, -7, s / 2 + 1);
    popMatrix();
  
  }
  translate(-x, -y, -z);
}

void spawnNumber(){
  for(int h = 0; h < 4; h++){
    int x = (int)random(0,3);
    int y = (int)random(0,3);
    int z = (int)random(0,3);
    int r = (int)random(1,2);
    if( box[x][y][z] == 0) box[x][y][z] = r;
    
  }
}

void boxmove_right(){
  for(int k = 0; k < 4; k++){//z
    for(int j = 0; j < 4; j++){//y
      for(int i = 2; i > -1; i--){//x
        if( box[i][j][k] != 0 && box[i][j][k] == box[i+1][j][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
           box[i+1][j][k] = box[i+1][j][k] + 1;
           box[i][j][k] = 0;
        }
        else if( box[i][j][k] != 0 && box[i+1][j][k] == 0 ){//前が空白の場合、ブロックを進める
           box[i+1][j][k] = box[i][j][k];
           box[i][j][k] = 0;
        }
      }
    }
  }
}

void boxmove_left(){
  for(int k = 0; k < 4; k++){//z
    for(int j = 0; j < 4; j++){//y
      for(int i = 1; i < 4; i++){//x
        if( box[i][j][k] != 0 && box[i][j][k] == box[i-1][j][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
           box[i-1][j][k] = box[i-1][j][k] + 1;
           box[i][j][k] = 0;
        }
        else if( box[i][j][k] != 0 && box[i-1][j][k] == 0 ){//前が空白の場合、ブロックを進める
           box[i-1][j][k] = box[i][j][k];
           box[i][j][k] = 0;
        }
      }
    }
  }
}

void boxmove_down(){
  for(int k = 0; k < 4; k++){//z
    for(int i = 0; i < 4; i++){//x
      for(int j = 2; j > -1; j--){//y
        if( box[i][j][k] != 0 && box[i][j][k] == box[i][j+1][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
           box[i][j+1][k] = box[i][j+1][k] + 1;
           box[i][j][k] = 0;
        }
        else if( box[i][j][k] != 0 && box[i][j+1][k] == 0 ){//前が空白の場合、ブロックを進める
           box[i][j+1][k] = box[i][j][k];
           box[i][j][k] = 0;
        }
      }
    }
  }
}

void boxmove_up(){
  for(int k = 0; k < 4; k++){//z
    for(int i = 0; i < 4; i++){//x
      for(int j = 1; j < 4; j++){//y
        if( box[i][j][k] != 0 && box[i][j][k] == box[i][j-1][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
           box[i][j-1][k] = box[i][j-1][k] + 1;
           box[i][j][k] = 0;
        }
        else if( box[i][j][k] != 0 && box[i][j-1][k] == 0 ){//前が空白の場合、ブロックを進める
           box[i][j-1][k] = box[i][j][k];
           box[i][j][k] = 0;
        }
      }
    }
  }
}

void boxmove_back(){
  for(int j = 0; j < 4; j++){//y
    for(int i = 0; i < 4; i++){//x
      for(int k = 2; k > -1; k--){//z
        if( box[i][j][k] != 0 && box[i][j][k] == box[i][j][k+1] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
           box[i][j][k+1] = box[i][j][k+1] + 1;
           box[i][j][k] = 0;
        }
        else if( box[i][j][k] != 0 && box[i][j][k+1] == 0 ){//前が空白の場合、ブロックを進める
           box[i][j][k+1] = box[i][j][k];
           box[i][j][k] = 0;
        }
      }
    }
  }
}

void boxmove_front(){
  for(int j = 0; j < 4; j++){//y
    for(int i = 0; i < 4; i++){//x
      for(int k = 1; k < 4; k++){//z
        if( box[i][j][k] != 0 && box[i][j][k] == box[i][j][k-1] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
           box[i][j][k-1] = box[i][j][k-1] + 1;
           box[i][j][k] = 0;
        }
        else if( box[i][j][k] != 0 && box[i][j][k-1] == 0 ){//前が空白の場合、ブロックを進める
           box[i][j][k-1] = box[i][j][k];
           box[i][j][k] = 0;
        }
      }
    }
  }
}
