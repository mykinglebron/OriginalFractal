ArrayList<int[]> fracies = new ArrayList<int[]>();
int numFracies = 0;
int maxLifetime = 4000;
int fractalSize = 100;

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  background(0);

  for (int i = 0; i < fracies.size(); i++) {
    int[] fracie = fracies.get(i);
    int x = fracie[0];
    int y = fracie[1];
    int siz = fracie[2];
    long creationTime = fracie[3];
    int transparency = calculateTransparency(creationTime);
    stroke(218, 165, 32, transparency);
    myFractal(x, y, siz, 0);

    if (millis() - creationTime > maxLifetime) {
      fracies.remove(i);
      i--;
    }
  }
}

void myFractal(int x, int y, int siz, int counter) {
  noFill();
  rect(x, y, siz, siz);

  if (counter < 3 && siz > 5) {
    counter++;
    myFractal(x - siz / 2, y - siz / 2, siz / 2, counter);
    myFractal(x + siz / 2, y + siz / 2, siz / 2, counter);
    myFractal(x - siz / 2, y + siz / 2, siz / 2, counter);
    myFractal(x + siz / 2, y - siz / 2, siz / 2, counter);
  }
}

int calculateTransparency(long creationTime) {
  return 255 - (int) map(millis() - creationTime, 0, maxLifetime, 0, 255);
}

void mouseClicked() {
  if (numFracies < 10) {
    int[] fractalInfo = {mouseX, mouseY, fractalSize, millis()};
    fracies.add(fractalInfo);
  }
}
