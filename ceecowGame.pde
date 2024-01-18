float rotX=0,rotY=0;//回転軸;
int score=0;//点数
int[][][] box = new int [4][4][4];

class a{

}


void setup() {
  size(640, 640, P3D);
  startbox();
}

void draw() {
  background(120);
  drawscore();
  translate(width / 2, height / 2, -100);
  rotateX(rotX);
  rotateY(rotY);
  drawaxis();
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
        box[i][j][k] = 16;
      }
    }
  }
}

void drawscore(){
  fill(255);
  textSize(50);
  textAlign(LEFT,CENTER);
  text(score,50,50);
}

void drawaxis(){
  stroke(255,0,0);
  line(0,0,0,400,0,0);
  stroke(0,255,0);
  line(0,0,0,0,400,0);
  stroke(0,0,255);
  line(0,0,0,0,0,400);
  stroke(0,255,255);
  line(0,0,0,-400,0,0);
  stroke(255,0,255);
  line(0,0,0,0,-400,0);
  stroke(255,255,0);
  line(0,0,0,0,0,-400);
}

void startbox(){
  score = 0;
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      for(int k = 0; k < 4; k++){
        box[i][j][k] = 0;
      }
    }
  }
  spawnNumber();
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
  else if( keyCode == SHIFT){//down
    boxmove_down();
    spawnNumber();
  }
  else if( key == ' '){//up
    boxmove_up();
    spawnNumber();
  }
  else if( key == 'w'){//front
    boxmove_front();
    spawnNumber();
  }
  else if( key == 's'){//back
    boxmove_back();
    spawnNumber();
  }
  else if( key == 'c'){//cheat mode
    cheat();
    spawnNumber();
  }
  else if( key == 'r'){//reset
    startbox();
    spawnNumber();
  }
 else if( keyCode == UP){//camera up
    rotX = rotX + 0.1;
  }
  else if( keyCode == DOWN){camera down
    rotX = rotX - 0.1;
  }
  else if( keyCode == LEFT){//camera left
    rotY = rotY - 0.1;
  }
  else if( keyCode == RIGHT){//camera right
    rotY = rotY + 0.1;
  }
  else if( key == 'f'){//camera reset
    rotY = 0;
    rotX = 0;
  }
}

void drawTextOnCube(float x,float y,float z,int c) {
  stroke(0,0,0);
  float s = 50; // 立方体のサイズ
  int pow = (int)pow(2,c);
  translate(x, y, z);
  if( c == 0 )noFill();//0
  else if( c == 1 ) fill(238,228,218);//2
  else if( c == 2 ) fill(237,224,200);//4
  else if( c == 3 ) fill(242,177,121);//8
  else if( c == 4 ) fill(245,149,99);//16
  else if( c == 5 ) fill(246,124,96);//32
  else if( c == 6 ) fill(246,94,59);//64
  else if( c == 7 ) fill(237,207,115);//128
  else if( c == 8 ) fill(237,204,98);//256
  else if( c == 9 ) fill(237,200,80);//512
  else if( c == 10 ) fill(237,197,63);//1024
  else if( c == 11 ) fill(237,194,45);//2048
  else if( c == 12 ) fill(97,216,146);//4096
  else if( c == 13 ) fill(39,187,102);//8192
  else if( c >= 14 ) fill(35,143,83);//over 16384
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
  for(int i = 0; i < 8; i++){
    int x = (int)random(0,4);
    int y = (int)random(0,4);
    int z = (int)random(0,4);
    int r = (int)random(1,3);//2 or 4
    if( box[x][y][z] == 0) {
      box[x][y][z] = r;
    }
    
  }
}

void boxmove_right(){
  for(int k = 0; k < 4; k++){//z
    for(int j = 0; j < 4; j++){//y
      for(int i = 2; i > -1; i--){//x
        for(int n = i; n < 3; n++){//一回の操作でブロックが端まで移動できるようにする。
          if( box[n][j][k] != 0 && box[n][j][k] == box[n+1][j][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
             box[n+1][j][k] = box[n+1][j][k] + 1;
             score = score + (int)pow(2,box[n][j][k]+1);//合成した数字が点数として入る。
             box[n][j][k] = 0;
          }
          else if( box[n][j][k] != 0 && box[n+1][j][k] == 0 ){//前が空白の場合、ブロックを進める
             box[n+1][j][k] = box[n][j][k];
             box[n][j][k] = 0;
          }
        }
      }
    }
  }
}

void boxmove_left(){
  for(int k = 0; k < 4; k++){//z
    for(int j = 0; j < 4; j++){//y
      for(int i = 1; i < 4; i++){//x
        for(int n = i; n > 0; n--){
          if( box[n][j][k] != 0 && box[n][j][k] == box[n-1][j][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
             box[n-1][j][k] = box[n-1][j][k] + 1;
             score = score + (int)pow(2,box[n][j][k]+1);//合成した数字が点数として入る。
             box[n][j][k] = 0;
          }
          else if( box[n][j][k] != 0 && box[n-1][j][k] == 0 ){//前が空白の場合、ブロックを進める
             box[n-1][j][k] = box[n][j][k];
             box[n][j][k] = 0;
          }
        }
      }
    }
  }
}

void boxmove_down(){
  for(int k = 0; k < 4; k++){//z
    for(int i = 0; i < 4; i++){//x
      for(int j = 2; j > -1; j--){//y
        for(int n = j; n < 3; n++){//一回の操作でブロックが端まで移動できるようにする。
          if( box[i][n][k] != 0 && box[i][n][k] == box[i][n+1][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
             box[i][n+1][k] = box[i][n+1][k] + 1;
             score = score + (int)pow(2,box[i][n][k]+1);//合成した数字が点数として入る。
             box[i][n][k] = 0;
          }
          else if( box[i][n][k] != 0 && box[i][n+1][k] == 0 ){//前が空白の場合、ブロックを進める
             box[i][n+1][k] = box[i][n][k];
             box[i][n][k] = 0;
          }
        }
      }
    }
  }
}

void boxmove_up(){
  for(int k = 0; k < 4; k++){//z
    for(int i = 0; i < 4; i++){//x
      for(int j = 1; j < 4; j++){//y
        for(int n = j; n > 0; n--){
          if( box[i][n][k] != 0 && box[i][n][k] == box[i][n-1][k] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
             box[i][n-1][k] = box[i][n-1][k] + 1;
             score = score + (int)pow(2,box[i][n][k]+1);//合成した数字が点数として入る。
             box[i][n][k] = 0;
          }
          else if( box[i][n][k] != 0 && box[i][n-1][k] == 0 ){//前が空白の場合、ブロックを進める
             box[i][n-1][k] = box[i][n][k];
             box[i][n][k] = 0;
          }
        }
      }
    }
  }
}

void boxmove_back(){
  for(int j = 0; j < 4; j++){//y
    for(int i = 0; i < 4; i++){//x
      for(int k = 2; k > -1; k--){//z
        for(int n = k; n < 3; n++){//一回の操作でブロックが端まで移動できるようにする。
          if( box[i][j][n] != 0 && box[i][j][n] == box[i][j][n+1] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
             box[i][j][n+1] = box[i][j][n+1] + 1;
             score = score + (int)pow(2,box[i][j][n]+1);//合成した数字が点数として入る。
             box[i][j][n] = 0;
          }
          else if( box[i][j][n] != 0 && box[i][j][n+1] == 0 ){//前が空白の場合、ブロックを進める
             box[i][j][n+1] = box[i][j][n];
             box[i][j][n] = 0;
          }
        }
      }
    }
  }
}

void boxmove_front(){
  for(int j = 0; j < 4; j++){//y
    for(int i = 0; i < 4; i++){//x
      for(int k = 1; k < 4; k++){//z
        for(int n = k; n > 0; n--){
          if( box[i][j][n] != 0 && box[i][j][n] == box[i][j][n-1] ){//前のブロックと数字が同じ場合、前の数字を2倍にする。
             box[i][j][n-1] = box[i][j][n-1] + 1;
             score = score + (int)pow(2,box[i][j][n]+1);//合成した数字が点数として入る。
             box[i][j][n] = 0;
          }
          else if( box[i][j][n] != 0 && box[i][j][n-1] == 0 ){//前が空白の場合、ブロックを進める
             box[i][j][n-1] = box[i][j][n];
             box[i][j][n] = 0;
          }
        }
      }
    }
  }
}
