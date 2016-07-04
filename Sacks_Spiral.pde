// before becoming a GitHub repository
// this file was stored as sacks_spiral_2

float step;

void setup() {
 size(850,1202);
 background(255);
 noSmooth();
 step = 2;

 display();
   saveFrame("sacks-spiral-###.tif");
}

void display() {
  background(255);
  translate(width/2,height/2);



  rectMode(CENTER);


  for (int i = 1 ; i <= 400 ; i++) {
      int prev = (i-1)*(i-1);
      int sq = i*i;
      float startR = (i-1)*step;
      int diff = sq-prev;
      float dTheta = TWO_PI/diff;

      for (int j = 1 ; j < diff ; j++) {
          PVector v = rotate(new PVector(startR+step*j/diff,0),
                      -dTheta*j);
          
          if (checkPrime(prev+j)) {
            fill(0);
            rect(v.x,v.y,3,3);
          }
        
      }
  }

}

PVector rotate(PVector p, float theta) {
  return new PVector(p.x*cos(theta)-p.y*sin(theta),p.y*cos(theta)+p.x*sin(theta));
}

boolean checkPrime(int n) {
    if (n < 2) {
       return false; 
    }
    
    if (n == 2) {
       return true; 
    }
    
    for (int i = 2 ; i <= floor(sqrt(n)) ; i++) {
        if (n%i == 0) return false; 
    }
  
    return true;
}  