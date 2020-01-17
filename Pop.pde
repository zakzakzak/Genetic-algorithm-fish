class Population {
  Rocket[] rockets;
  Rocket[] matingpool;
  int popSize;

  Population() {
    this.popSize = 300;
    this.rockets = new Rocket[this.popSize];
    for (int i = 0; i < this.popSize; i++) {
      this.rockets[i] = new Rocket();
    }
    
  }

  void evaluate() {
    float maxFit = 0;
    for (int i = 0; i < this.popSize; i++) {
      this.rockets[i].calcFitness();
      if (this.rockets[i].fitness > maxFit) {
        maxFit = this.rockets[i].fitness;
      }
    }
    for (int i = 0; i < this.popSize; i++) {
      this.rockets[i].fitness /= maxFit;
    }
    int jum = 0;

    for (int i = 0; i < this.popSize; i++) {
      int n = floor(this.rockets[i].fitness * 100);
      //print(this.rockets[i].fitness);
      jum += n;
    }
    //print(jum);
    this.matingpool = new Rocket[jum];

    int countr = 0;
    for (int i = 0; i < this.popSize; i++) {
      int n = floor(this.rockets[i].fitness * 100);
      for (int j = 0; j < n; j++) {
        this.matingpool[countr] = this.rockets[i];
        countr++;
      }
    }
  }
  //-----------------------------------------------
  void selection() {
    Rocket[] newRockets = new Rocket[this.rockets.length];
    Rocket rkt = new Rocket();
    float max = this.rockets[0].fitness;
    for (int i = 0; i < this.rockets.length; i++) {
      if (max < this.rockets[i].fitness) {
        rkt = new Rocket();
        rkt = this.rockets[i];
      }
    }
    newRockets[0] = rkt;
    for (int i = 0; i < this.rockets.length; i++) {

      int a = floor(random(this.matingpool.length));
      int b = floor(random(this.matingpool.length));
      DNA parentA = this.matingpool[a].dna;
      DNA parentB = this.matingpool[b].dna;
      DNA child = parentA.crossOver(parentB);
      child.mutation();
      newRockets[i] = new Rocket(child);
    }

    this.rockets = newRockets;
  }
  //----------------------------------------------
  void run(float x, float y, float a, float b, float c, float d, float e, float f, float g, float h) {
    for (int i = this.popSize - 1; i >= 0; i--) {
      this.rockets[i].update(a, b, c, d, e, f, g, h);
      this.rockets[i].show(x, y);
      //print("OK");
    }
    //for (int i = 0; i < this.popSize; i++) {
    //  this.rockets[i].update(a, b, c, d, e, f, g, h);
    //  this.rockets[i].show(x, y);
    //  print("OK");
    //}
  }
}



/*
function Population() {
 this.rockets = [];
 this.matingpool = [];
 this.popSize = 300;
 
 for (var i = 0; i < this.popSize; i++) {
 this.rockets[i] = new Rocket();
 }
 
 // INI NIH YANG PENTING
 this.evaluate = function() {
 
 var maxFit = 0;
 for (var i = 0; i < this.popSize; i++) {
 this.rockets[i].calcFitness();
 if (this.rockets[i].fitness > maxFit) {
 maxFit = this.rockets[i].fitness;
 // tanda.x = this.rockets[i].pos.x;
 // tanda.y = this.rockets[i].pos.y;
 }
 }
 
 for (var i = 0; i < this.popSize; i++) {
 this.rockets[i].fitness /= maxFit;
 }
 
 this.matingpool = [];
 
 for (var i = 0; i < this.popSize; i++) {
 var n = this.rockets[i].fitness * 100;
 for (var j = 0; j < n; j++) {
 this.matingpool.push(this.rockets[i]);
 }
 }
 }
 
 this.selection = function() {
 var newRockets = [];
 //---b
 var rkt = new Rocket();
 var max = this.rockets[0].fitness;
 for (var i = 0; i < this.rockets.length; i++) {
 if (max < this.rockets[i].fitness) {
 rkt = new Rocket();
 rkt = this.rockets[i];
 }
 }
 //---e
 newRockets[0] = rkt;
 for (var i = 0; i < this.rockets.length; i++) {
 var parentA = random(this.matingpool).dna;
 var parentB = random(this.matingpool).dna;
 var child = parentA.crossOver(parentB);
 child.mutation();
 newRockets[i] = new Rocket(child);
 }
 // PS : POPULASI BARU ADALAH HASIL PERNIKAHAN
 //      TIDAK ADA PROSES SORTING
 
 
 // if(0.1 < random(1)){
 //   newRockets[this.rockets.length-1] = new Rocket();
 // }
 this.rockets = newRockets;
 }
 
 this.run = function(x, y, a, b, c, d, e, f, g, h) {
 for (var i = this.popSize - 1; i >= 0; i--) {
 this.rockets[i].update(a, b, c, d, e, f, g, h);
 this.rockets[i].show(x, y);
 }
 // print(dapat);
 // dapat = 0;
 }
 
 }
 */