Population popul;
Population popul2;
Population popul3;
int lifeSpan;

int count;
PVector target;
int cs;



float x1 = (800 / 3) - 50;
float y1 = 0;
float w1 = 8;
float h1 = 200;

float x2 = (800 / 3) - 50;
float y2 = 200;
float w2 = 8;
float h2 = 200;


float x3 = (800 / 3) * 2;
float y3 = 0;
float w3 = 8;
float h3 = 200;

float x4 = (800 / 3) * 2;
float y4 = 200;
float w4 = 8;
float h4 = 200;

float maxfor = 0.4;

int gener;

void setup() {
  size(1200, 400);
  cs = 0;
  lifeSpan = 340;
  popul = new Population();
  popul2 = new Population();
  popul3 = new Population();
  
  //lifeP = createP();
  //genP = createP();
  count = 0;
  gener = 0;

  target = new PVector(1000, height / 2);

}

void draw() {
  fill(20, 10);
  rect(0, 0, width, height);
  popul.run(0, 200, x1, y1, w1, h1, x4, y4, w4, h4);
  popul2.run(200, 0, x2, y2, w2, h2, x3, y3, w3, h3);
  popul3.run(200, 200, 0, 0, 0, 0, 0, 0, 0, 0);


  textSize(12);
  fill(255);
  text("Generation : " + gener, 5, 20);
 
  count++;

  if (count == lifeSpan) {
    popul.evaluate();
    popul.selection();
    popul2.evaluate();
    popul2.selection();
    popul3.evaluate();
    popul3.selection();
    gener++;

    count = 0;
  }

  fill(random(200, 255), 0, random(100, 155));
  noStroke();

  noFill();
  rectMode(CENTER);
  rect(target.x, target.y, 15, 15);
  rectMode(CORNER);
  //target = new PVector(mouseX, mouseY);
  //delay(20);
  if(gener % 50 <= 10 && count % 5 == 0){
     saveFrame("hasil2/ga_fish_######");
     cs++;
  }
//gener % 5 == 0 && 

}