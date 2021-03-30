
class Bird{
  float x = 200;
  float y = height/2;
  float vy = 0;
  float r = 35;
  int puntuacion;
  float adecuacion;
  int colr = 200 ;
  
  int n_input = 5;
  int n_hiden = 100;
  int n_output = 2;
  
  float[][] W1 = new float[n_input][n_hiden];
  float[][] B1 = new float[1][n_hiden];
  float[][] W2 = new float[n_hiden][n_output];
  float[][] B2 = new float[1][n_output];
  
  float[][]Inp;
  float[][]Out;
  
  NNetwork brain = new NNetwork(n_input, n_hiden, n_output);
  
  Bird(){
    //Matrices aleatorias
    W1 = randomMatrix(n_input,n_hiden);
    B1 = randomMatrix(1,n_hiden);
    W2 = randomMatrix(n_hiden,n_output);
    B2 = randomMatrix(1,n_output);
    brain = new NNetwork(n_input, n_hiden, n_output);
    y = height/2;
  }
  
  Bird(float[][][] MaterialGenetico,float rate){
    puntuacion = 0;
    adecuacion = 0;
      brain = new NNetwork(n_input,n_hiden,n_output);
      W1 = mutateMatrix(MaterialGenetico[0],rate);
      B1 = mutateMatrix(MaterialGenetico[1],rate);
      W2 = mutateMatrix(MaterialGenetico[2],rate);
      B2 = mutateMatrix(MaterialGenetico[3],rate);
      //println("mutado");
      y = height/2;
  }
      
  void think(ArrayList<Pipe> pipe){
    //println("pienso");
    float[][] Inp = new float[1][n_input];
    
    Pipe cercano = null;
    float dist = Float.POSITIVE_INFINITY;
    for (int i = 0; i < pipe.size(); i++){
      Pipe p = pipe.get(i);
      float d = (p.x+p.w) - x;
      if (d < dist && d > 0){
        cercano = pipe.get(i);
        dist = d;
      }
    }
    
    Inp[0][0] = y/height;
    Inp[0][1] = vy/10;
    Inp[0][2] = cercano.top / height;
    Inp[0][3] = cercano.bottom / width;
    Inp[0][4] = cercano.x / width;
    
    Out = brain.guess(Inp,W1,B1,W2,B2);
    if(Out[0][0]>Out[0][1]){
        //Out[0][0]>Out[0][1]
        //println("Salto");
        jump();
      }
    //print(Out[0].length);
  }
  
  void update(){
      puntuacion++;
      vy = vy + 0.3;
      y = y + vy;
  }
  
  void show(){
    //dibuja el pajaro, que es uan bola
    fill(colr,0,0);
    noStroke();
    ellipse(x,y,r,r);
  }
  
  void jump(){
    //hace saltar al pajaro
    vy = -4;   
  }
  
  float[][][] genetics(){
    //Devuelve una matriz tridimensional con todas las matrices que definen su comportamiento, le llamamos a las matriz "material genetico"
    float[][][] A = new float[4][][];
    A[0] = W1;
    A[1] = B1;
    A[2] = W2;
    A[3] = B2;
    return A;
  }
  
  boolean muerte(){
    return (y+r > height || y < r);
  }
}
