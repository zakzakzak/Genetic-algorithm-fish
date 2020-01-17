class DNA {
  PVector[] genes;

  DNA() {
    //print(lifeSpan);
    this.genes = new PVector[lifeSpan];
    for (int i = 0; i < lifeSpan; i++) {
      this.genes[i] = PVector.random2D();
      this.genes[i].setMag(0.1);
    }
  }

  DNA(PVector[] genes) {
    this.genes = genes;
  }

  DNA crossOver(DNA partner) {
    PVector[] newgenes = new PVector[lifeSpan];
    int mid = floor(random(this.genes.length));
    for (int i = 0; i < this.genes.length; i++) {
      if (i > mid) {
        newgenes[i] = this.genes[i];
      } else {
        newgenes[i] = partner.genes[i];
      }
    }
    return new DNA(newgenes);
  }

  void mutation() {
    for (int i = 0; i < this.genes.length; i++) {
      if (random(1) < 0.0005) {
        this.genes[i] = PVector.random2D();
        this.genes[i].setMag(maxfor);
      }
    }
  }
}