int n_birds = 500;
int generacion = 1;


ArrayList<Pipe> pipes = new ArrayList<Pipe>();

ArrayList<Bird> pooblacion = new ArrayList<Bird>();
ArrayList<Bird> muertos = new ArrayList<Bird>();

Bird mejor_pajaro;
Bird mejor_pajaro2 = new Bird();
float[][][] genetic_material;

int contador;

void setup(){
  size(1300,800);
  
  for (int i = 0; i < n_birds; i++){
    pooblacion.add(new Bird());
  } 
}

void draw(){

  background(240);
  if (contador % 75 == 0){
    pipes.add(new Pipe());
    //println("nueva tuberia");
  }
  
  if (pooblacion.size() == 0)
  {
    contador = 0;
    println("Todos la han roscado");
    println("Generacion "+generacion);
    pipes.clear();
    pipes.add(new Pipe());
    generacion++;
    //Creo la nueva Generación
    //delay(1000);
    calc_adecuacion();
    mejor_pajaro = findBest();
    genetic_material = mejor_pajaro.genetics();
    float rate = abs(0.3 - (1000/(mejor_pajaro.puntuacion*+1)));
    println(rate);
    for (int i = 0; i < n_birds-1; i++){
      pooblacion.add(new Bird(genetic_material,rate));
    }
    pooblacion.add(mejor_pajaro);
    muertos.clear();
  }
  
  for (int i = pipes.size()-1; i >= 0; i--){
    Pipe p = pipes.get(i);
    p.update();
    if (p.offscreen()){
      pipes.remove(i);
      //println("borrado");
    }
    for (int j = pooblacion.size()-1; j >= 0; j--){
      Bird b = pooblacion.get(j);
      if (p.hit(b) || b.muerte()){
        muertos.add(b);
        pooblacion.remove(j);
      }
    }
  }
  for (Bird b : pooblacion){
    b.show();
    b.update();
    b.think(pipes);
  }
  
    for (int i = pipes.size()-1; i >= 0; i--){
    Pipe p = pipes.get(i);
    p.show();
  }
  textSize(32);
  fill(0);
  text(muertos.size(),100,100);
  contador++;
  
  
}
