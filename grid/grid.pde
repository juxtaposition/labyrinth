ArrayList<Celda> celdas; // Conjunto con todas las CELDAS o.o
ArrayList<Celda> recorrido; // Movimientos realizados, (STACK) 
String[] lados = {"l","r","u","d"}; // Movimientos posibles
void setup(){
background(250);
recorrido = new ArrayList<Celda>();
celdas = new ArrayList<Celda>();
noLoop();
int k=30,n=20;
size(n*k+10,n*k+10);
frameRate(5);
}
int k=30,n=20;
Celda[][] biCeldas = new Celda[(n*k)+1][(n*k)+1];

void draw(){

 int k=30,n=20;
for (int x=0;x<=(k*n);x=x+k){
   for (int y=0;y<=(k*n);y=y+k){
        //Inicializando las celdas las vamos insertando en el arrelgo "celdas"
 celdas.add(new Celda(x,y,false , false, int(random(0,250))));
biCeldas[x][y] = new Celda(x,y,false , false, int(random(0,250)));
     if(x!=k*n){
          line(x,y,x+k,y);
//celdas.add(new Celda(x,y,x+k,y,false , false, int(random(0,250))));

             }
      if(y!=k*n){
//celdas.add(new Celda(x,y,x,y+k,false , false, int(random(0,250))));
          line(x,y,x,y+k);
      }    
   }
}

/**
Código que muestra las celdas con  su respectivo color.
**/

/*for(int i=0;i<n*k;i=i+k){
  for(int j = 0;j<n*k;j=j+k){

    //println(biCeldas[i][j]);
Celda temp = biCeldas[i][j]; 
celdaColor(temp.getX(), temp.getY(),temp.getColor());

  }
} */

moveRandom(initRandom());
} // END DRAW 


/**
**@Params Celda c, Side lado 
**@return boolean r
**Método verificar si el movimiento deseado es válido o no
**/
boolean checkMove(Celda c, String lado){  
  boolean r = false;
  
  switch(lado.charAt(0)){
    case 'l':
    if(c.getX() - 30 >= 0){
       r = true; 
    }else { r =  false;}
    
    println("Do somthing: "+lado);
    break;
    
    case 'r':
    if(c.getX() + 30 <= 570){
       r =  true; 
    }else { r =  false;}
       
    println("Do Something: "+lado);
    break;
    
    case 'u':
    if(c.getY() - 30 >= 0){
       r =  true; 
    }else { r = false;}
    
    println("Do Something: "+lado);
    break;
    
    case 'd':
    if(c.getY() + 30 <= 570){
       r =  true; 
    }else { r = false;}
    
    println("Do Something: "+lado);
    break;
    
    
  } // END switch
  return r;
}



/**
**@Params Celda c 
**@return
**Método encargado de mover una posición la celda. de manera Aleatoria
**/
void moveRandom(Celda c){
  
Celda temp = c;
int si = int(random(0,4));
String side = lados[si];
 if(side == "l"){    
   if(checkMove(temp,side)){
     temp = biCeldas[temp.getX()-k][temp.getY()];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
   }else { println("Moviento no permitodo, necesitamos otro"); }
  println("Valido LEFT");
  println(temp.toString()); 
 }else if(side == "r"){
  if(checkMove(temp,side)){
     temp = biCeldas[temp.getX()+k][temp.getY()];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
  } else { println("Moviento no permitodo, necesitamos otro"); }
   println("lado R");
   println(temp.toString()); 

 }else if(side == "u"){
  if(checkMove(temp,side)){
     temp = biCeldas[temp.getX()][temp.getY()-k];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
  }else { println("Moviento no permitodo, necesitamos otro"); }

    println("Lado U");
    println(temp.toString()); 

 }else if(side == "d"){
   if(checkMove(temp,side)){
     temp = biCeldas[temp.getX()][temp.getY()+k];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
   }else{ println("Necesitamos otro moviento"); }
  println("lado D");
  println(temp.toString()); 

 } else {print ("Algo paso"); }
  
} // END MoveRandom



/**
**@Params int x, int y, int z, int w
**@return void
** Función que borra un lado de la celda. 
**/
void borraLine(int x,int y,int z,int w){
stroke(250);
line(x,y,z,w);
}



// Ejemplos particulares
void celdaColor(int x,int y, int c){
  //fill(c,int(random(0,250)),int(random(0,250))); // una malla colorida :D
  fill(c,0,0); // Una base en ROJO
  //rect(0,0,30,30);
  rect(x,y,k,k);

}

/**@Params 
**@Return void
** función Inicial la cual posicionara una celda en una localidad random
**/
Celda initRandom(){
 int i = int(random(0,celdas.size()));
  
Celda temp = celdas.get(i);
if(temp.getX() == 600 || temp.getY() == 600){
println("No queremos los bordes");
temp = celdas.get(0);
  }
temp.setColor(200);
temp.setVisited(true);
celdaColor(temp.getX(), temp.getY(),temp.getColor());
/*borraLine(temp.getX(), temp.getY(),temp.getX()+k, temp.getY()); // Borra Top
borraLine(temp.getX(), temp.getY(),temp.getX(), temp.getY()+k); // Borra Left
borraLine(temp.getX()+k, temp.getY(),temp.getX()+k, temp.getY()+k); // Borra Left 
borraLine(temp.getX()+k, temp.getY()+k,temp.getX(), temp.getY()+k); // Borra Down*/ 

/*fill(temp.getColor());
ellipse(temp.getX(), temp.getY(),10,10);*/
println(temp.toString() + " i: "+i); // Información de la CELDA ACTUAL Si es necesario quita el comentario
return temp;
  
}



/**
**@author Team IA
**@version 0.0.1 september 2,  2014.
**/
class Celda{
  
  int x,y,z,w=0; // Cordenada de los dos puntos
  boolean Visited = false; // Si ya fue visitado
  boolean Done = false; // Si ya fue creado
  int farbe = 0; // Su color
  /** Por default todos los lados estan disponibles en una celda 
  ** hasta que empiece a avanzar **/
  boolean Left = true;
  boolean Right = true;
  boolean Up = true;
  boolean Down = true; 
  


  Celda(int x,int y, boolean v, boolean d, int c){ // Constructor simple
  this.x = x; 
  this.y = y;
  Visited = v;
  Done = d;
  this.farbe = c;
}
  
  
  Celda(int x,int y,int z, int w, boolean v, boolean d, int c){ // Constructor simple
  this.x = x; 
  this.y = y;
  this.z = z;
  this.w = w;
  Visited = v;
  Done = d;
  this.farbe = c;
}

/**
**@Params
**@return boolean
**Método que regresa el lado LEFT 
**/
boolean getLeft(){
  return Left;
}

/**
**@Params
**@return boolean
**Método que regresa el lado RIGHT
**/
boolean getRight(){
  return Right;
}

/**
**@Params
**@return boolean
**Método que regresa el lado UP
**/
boolean getUp(){
  return Up;
}

/**
**@Params
**@return boolean
**Método que regresa el lado DOWN
**/
boolean getDown(){
  return Down;
}



/**
**@Params 
**@Return x
** Método get de X
**/
int getX(){
return x;
}

/**
**@Params 
**@Return y
** Método get de Y
**/
int getY(){
 return y; 
}

/**
**@Params 
**@Return z
** Método get de Z
**/
int getZ(){
 return z; 
}

/**
**@Params 
**@Return w
** Método get de W
**/
int getW(){
 return w; 
}

int getColor(){
 return farbe; 
}

/**
**@Params 
**Función Encargada de regresar el valor booleano de Visited
**/
boolean getVisited(){
 return Visited; 
}
  
/**
**@Params
**@Return Boolean
** Función que regresa el valor de Done - si ya está construida
** la celda del laberinto
**/
boolean getDone(){
 return Done;
 }
  
  
/**
**@params int n
**@return void
**/
void setX(int n){
   this.x = n; 
  }
  
  
/**
**@params int n
**@return void
**/
  void setY(int n){
   this.y = n; 
  }
   
  
  
 /**
 **@Params 
 ** Función que actualiza o inserta un nuevo color a la celda
 **/
void setColor(int c){
  this.farbe = c; 
 }
  
/**
**@params Boolean
**@return void
**Función Encargada de actualizar el estado Visited de una celda
**/
void setVisited(boolean v){
this.Visited = v; 
}


/**
**@Params boolean l
**@return void
** Método para evitar movernos por un lado (LEFT)
**/
void setLeft(boolean l){
 this.Left = l; 
}


/**
**@Params boolean l
**@return void
** Método para evitar movernos por un lado (RIGHT)
**/
void setRight(boolean l){
 this.Right = l; 
}


/**
**@Params boolean l
**@return void
** Método para evitar movernos por un lado (UP)
**/
void setUp(boolean l){
 this.Up = l; 
}

/**
**@Params boolean l
**@return void
** Método para evitar movernos por un lado (DOWN)
**/
void setDown(boolean l){
 this.Down = l; 
}


 
/**
**@params 
**@return String
**Método toString de Celda
**/
String toString(){
return ("("+x+","+y+")"+ "("+z+","+w+")" + " Visited: " + Visited + " Done: " + Done + " Color: " + farbe);
} 
   
}

/*//CLase celda
class Celda {
  float x,y;   // x,y location
  float w,h;   // width and height
  float c; // color
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempC;
  } 
  
  //
  void moverx() {
    x=x+k; 
  }

  void display() {
    fill(255);
    rect(x,y,w,h); 
  }
}*/
