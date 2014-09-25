/**
**@author Team IA
**@version 0.0.1 september 2,  2014.
**/
class Celda{
  
  int x,y,z,w=0; // Cordenada de los dos puntos
  boolean Visited = false; // Si ya fue visitado
  boolean Done = false; // Si ya fue creado
  int farbe = 0; // Su color
  /** Por default todos los lados ESTÁN disponibles en una celda 
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



/**@params 
**@return int farbe
** Get Color
**/
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
