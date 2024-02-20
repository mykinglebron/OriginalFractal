int[][] fracies = new int[10][4]; 
int numFracies = 0; 
int maxLifetime = 4000; 
int fractalSize = 100; 

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  background(0);
  
 
  for (int i = 0; i < numFracies; i++) {
    int[] fracie = fracies[i];
    int x = fracie[0];
    int y = fracie[1];
    int siz = fracie[2];
    long creationTime = fracie[3];
    int transparency = calculateTransparency(creationTime);
    stroke(218, 165, 32, transparency); 
    myFractal(x, y, siz, 0); 
    
    if (millis() - creationTime > maxLifetime) {
     
      for (int j = i; j < numFracies - 1; j++) {
        fracies[j] = fracies[j + 1];
      }
      numFracies--; 
    }
  }
}

void myFractal(int x, int y, int siz, int counter) {
  noFill();
  rect(x, y, siz, siz);
  
  if (counter < 3 && siz > 5) {
    counter++; // Increment counter
    myFractal(x - siz / 2, y - siz / 2, siz / 2, counter);
    myFractal(x + siz / 2, y + siz / 2, siz / 2, counter); 
    myFractal(x - siz / 2, y + siz / 2, siz / 2, counter); 
    myFractal(x + siz / 2, y - siz / 2, siz / 2, counter); 
  }
}

int calculateTransparency(long creationTime) {
 
  int transparency = 255 - (int) map(millis() - creationTime, 0, maxLifetime, 0, 255);
  return transparency;
}

void mouseClicked() {
  if (numFracies < fracies.length) {
    fracies[numFracies][0] = mouseX; 
    fracies[numFracies][1] = mouseY; 
    fracies[numFracies][2] = fractalSize; 
    fracies[numFracies][3] = millis(); 
    numFracies++; 
  }
}
