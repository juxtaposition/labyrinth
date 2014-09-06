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
        biCeldas[x][y] = new Celda(x,y,false , false, 250);
     if(x!=k*n){
       strokeWeight(2);
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


// Gastando memoria a lo loco 
void mousePressed() {
  loop();  
}


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
        if(!biCeldas[c.getX()-30][c.getY()].getVisited()){
       r = true; 
        }else { println("Quiere mover a un Visado Left");  }
    }else { r =  false;}
    
    //println("Do somthing: "+lado);
    break;
    
    case 'r':
    if(c.getX() + 30 <= 570){
      if(!biCeldas[c.getX()+30][c.getY()].getVisited()){

       r =  true;
      } else {println("Quiere mover a un Visado Right"); }
    }else { r =  false;}
       
   // println("Do Something: "+lado);
    break;
    
    case 'u':
    if(c.getY() - 30 >= 0){
      if(!biCeldas[c.getX()][c.getY()-30].getVisited()){

       r =  true;
      } else{ println("Quiere mover a un Visado UP"); }
    }else { r = false;}
    
   // println("Do Something: "+lado);
    break;
    
    case 'd':
    if(c.getY() + 30 <= 570){
      if(!biCeldas[c.getX()][c.getY()+30].getVisited()){

       r =  true; 
      }else { println("Quiere mover a un Visado Down"); }
    }else { r = false;}
    
    //println("Do Something: "+lado);
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
switch(side.charAt(0)){
  
 case 'l':    
   if(checkMove(temp,side)){
     borraLine(temp.getX(), temp.getY(),temp.getX(), temp.getY()+k); // Borra Left
     temp = biCeldas[temp.getX()-k][temp.getY()];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setVisited(true);
     temp.setLeft(false);
     recorrido.add(temp);
     //println("Borro L");
     moveRandom(temp); 
   }else {      
     
   println("Moviento no permitodo, necesitamos otro"); }
 
  //println("Valido LEFT");
  println(temp.toString());
  break;
  
 case 'r':
  if(checkMove(temp,side)){
     borraLine(temp.getX()+k, temp.getY(),temp.getX()+k, temp.getY()+k); // Borra Right
     temp = biCeldas[temp.getX()+k][temp.getY()];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setRight(false);
     temp.setVisited(true);
     recorrido.add(temp);
    // println("Borro R");
     moveRandom(temp); 
  } else {    // Otro moveRandom2(); 


  println("Moviento no permitodo, necesitamos otro"); }
   
  // println("lado R");
   println(temp.toString()); 
  break;
 
 case 'u':
  if(checkMove(temp,side)){
     borraLine(temp.getX(), temp.getY(),temp.getX()+k, temp.getY()); // Borra Up
     temp = biCeldas[temp.getX()][temp.getY()-k];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setUp(false);
     temp.setVisited(true);
     recorrido.add(temp);
     //println("Borro U");
moveRandom(temp); 
  }else {     
            // Otro moveRandom2(); 

  println("Moviento no permitodo, necesitamos otro"); }

   // println("Lado U");
    println(temp.toString()); 
  break;
  
 case 'd':
 if(checkMove(temp,side)){
     borraLine(temp.getX(), temp.getY()+k,temp.getX()+k, temp.getY()+k); // Borra Down
     temp = biCeldas[temp.getX()][temp.getY()+k];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setDown(false);
     temp.setVisited(true);
     recorrido.add(temp);
    //println("Borro D");
moveRandom(temp); 
   }else{ 
           // Otro moveRandom2(); 

   println("Necesitamos otro moviento"); }
   
  //println("lado D");
  println(temp.toString()); 
  break;

 default:
 print ("Algo paso"); 
 break;
 
} // END SWITCH
  
} // END MoveRandom



/**
**@Params int x, int y, int z, int w
**@return void
** Función que borra un lado de la celda. 
**/
void borraLine(int x,int y,int z,int w){
stroke(250);
line(x,y,z,w);
noStroke();
}



// Ejemplos particulares
void celdaColor(int x,int y, int c){
  noStroke();
  //fill(c,int(random(0,250)),int(random(0,250))); // una malla colorida :D
  fill(c,10,10); // Una base en ROJO
//  noFill();
  rect(x+2,y+2,k-3,k-3);

}

/**@Params 
**@Return void
** función Inicial la cual posicionara una celda en una localidad random
**/
Celda initRandom(){
 int i = int(random(0,celdas.size()));
  
Celda temp = celdas.get(i);
  if(temp.getX() == 600 || temp.getY() == 600){
    //println("No queremos los bordes");
      temp = celdas.get(0);
  }

temp.setColor(250);
temp.setVisited(true);
recorrido.add(temp);
celdaColor(temp.getX(), temp.getY(),temp.getColor());

/*fill(temp.getColor());
ellipse(temp.getX(), temp.getY(),10,10);*/
//println(temp.toString() + " i: "+i); // Información de la CELDA ACTUAL Si es necesario quita el comentario
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

