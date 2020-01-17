class Rocket {
  PVector pos;
  PVector vel;
  PVector acc;
  boolean completed;
  boolean crashed;
  DNA dna;
  float fitness;

  Rocket(DNA dna) {
    this.pos = new PVector(0, height / 2);
    this.vel = new PVector();
    this.acc = new PVector();
    this.completed = false;
    this.crashed = false;
    this.dna = dna;
    this.fitness = 0;
  }

  Rocket() {
    this.pos = new PVector(0, height / 2);
    this.vel = new PVector();
    this.acc = new PVector();
    this.completed = false;
    this.crashed = false;
    this.dna = new DNA();
    this.fitness = 0;
  }

  void applyForce(PVector force) {
    this.acc.add(force);
  }

  void calcFitness() {
    float d = dist(this.pos.x, this.pos.y, 
      target.x, target.y);
    //println(d);
    this.fitness = map(d, 0, width*2, width*2, 0); // 1/0 infinity
    if (this.completed) {
      this.fitness *= lifeSpan - count;
    }
    if (this.crashed) {
      this.fitness /= 30;
    }
  }

  void update(float qx, float qy, float qw, float qh, float wx, float wy, float ww, float wh) {
    float d = dist(this.pos.x, this.pos.y, target.x, target.y);
    if (d < 10) {
      this.completed = true;
      this.pos = target.copy();
    }


    if (this.pos.x > qx && this.pos.x < qx + qw &&
      this.pos.y > qy && this.pos.y < qy + qh) {
      this.crashed = true;
    }

    if (this.pos.x > wx && this.pos.x < wx + ww &&
      this.pos.y > wy && this.pos.y < wy + wh) {
      this.crashed = true;
    }
    //print(this.dna.genes.length);

    if (this.pos.x < 0 || this.pos.x > width + 300 ||
      this.pos.y < 50 || this.pos.y > 350) {
      this.crashed = true;
    }

    this.applyForce(this.dna.genes[count]);
    if (!this.completed && !this.crashed) {
      this.vel.add(this.acc);
      this.pos.add(this.vel);
      this.acc.mult(0);
    }
  }

  void show(float x, float y) {
    pushMatrix();
    noStroke();
    fill(random(x, x + 50), 0, random(y, y + 50), 200);
    if (x == y) {
      if (random(1) < 0.5) {
        fill(random(50) + 200, 0, random(50), 20);
      } else {
        fill(random(50), 0, random(50) + 200, 20);
      }
    }
    //fill(255);

    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());
    rectMode(CENTER);
    if (!this.crashed)
      ellipse(0, 0, 5, 5);
    popMatrix();
  }
}

/*
function Rocket(dna) {
 PVector pos;
 PVector vel;
 PVector acc;
 boolean completed;
 boolean crashed;
 DNA dna;
 float fitness;
 
 Rocket(DNA dna) {
 this.pos = createVector(0, height / 2);
 this.vel = createVector();
 this.acc = createVector();
 this.completed = false;
 this.crashed = false;
 this.dna = dna;
 this.fitness = 0;
 }
 
 Rocket() {
 this.pos = createVector(0, height / 2);
 this.vel = createVector();
 this.acc = createVector();
 this.completed = false;
 this.crashed = false;
 this.dna = new DNA();
 this.fitness = 0;
 }
 
 */



//this.calcFitness = function() {
//  var d = dist(this.pos.x, this.pos.y, 
//    target.x, target.y);

//  this.fitness = map(d, 0, width, width, 0); // 1/0 infinity
//  if (this.completed) {
//    this.fitness *= lifeSpan - count;
//  }
//  if (this.crashed) {
//    this.fitness /= 30;
//    // 20
//  }
//}

//this.update = function(qx, qy, qw, qh, wx, wy, ww, wh) {
//  var d = dist(this.pos.x, this.pos.y, target.x, target.y);
//  if (d < 10) {
//    this.completed = true;
//    this.pos = target.copy();
//  }


//  if (this.pos.x > qx && this.pos.x < qx + qw &&
//    this.pos.y > qy && this.pos.y < qy + qh) {
//    this.crashed = true;
//  }

//  if (this.pos.x > wx && this.pos.x < wx + ww &&
//    this.pos.y > wy && this.pos.y < wy + wh) {
//    this.crashed = true;
//  }

//  if (this.pos.x < 0 || this.pos.x > width ||
//    this.pos.y < 0 || this.pos.y > height) {
//    this.crashed = true;
//  }

//  this.applyForce(this.dna.genes[count]);
//  if (!this.completed && !this.crashed) {
//    this.vel.add(this.acc);
//    this.pos.add(this.vel);
//    this.acc.mult(0);
//  }
//}

//this.show = function(x, y) {
//  push();
//  noStroke();
//  fill(random(x, x + 50), 0, random(y, y + 50), 200);

//  translate(this.pos.x, this.pos.y);
//  rotate(this.vel.heading());
//  rectMode(CENTER);
//  if (!this.crashed)
//    ellipse(0, 0, 5, 5);
//  pop();
//}
//}