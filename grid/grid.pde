ArrayList<Celda> celdas; // Conjunto con todas las CELDAS o.o
ArrayList<Celda> recorrido; // Movimientos realizados, (STACK) 
String[] lados = {"l","r","u","d"}; // Movimientos posibles


void setup(){
background(120,120,120,14);
recorrido = new ArrayList<Celda>();
celdas = new ArrayList<Celda>();
//noLoop();
int k=30,n=20;
size(n*k+10,n*k+10);
frameRate(5);
}

boolean spamclickfukingyourself = true;
Celda salida = new Celda(0,0,false,false,0);
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
 // moveRandom(initRandom());

} // END DRAW 


// Gastando memoria a lo loco 

void mousePressed(){
  
  if(spamclickfukingyourself){
    
   Celda temp = initRandom();
   spamclickfukingyourself = false;
   
   
     while(sideEnable(temp) != "e"){
 temp = moveRandom(temp);
  }
  
  
  backTraking(temp); 
  
  }
  else{
     Celda temp = salida;
       while(sideEnable(temp) != "e"){
 temp = moveRandom(temp);
  }
  backTraking(temp); 
  

  }
  loop();  
 
}



// DIOS MIO ESTE PROGRAMA ME TIENE HASTA EL COPETE!!!!
// Backtraking Power 
void backTraking(Celda c){
  println(recorrido.size());
  Celda temp = c;
  celdaColor(temp.getX(),temp.getY(),0); 

 if(recorrido.size() != 0){
  for(int i = recorrido.size()-1;i>0;i--){
    if(sideEnable(recorrido.get(i)) != "e"){
      temp = recorrido.get(i);
   //  moveRandom(recorrido.get(i));
  // println("tiene salidas");
   celdaColor(temp.getX(),temp.getY(),190);
   salida = temp;
     break;
    }else{
        celdaColor(recorrido.get(i).getX(),recorrido.get(i).getY(),0);
     recorrido.remove(i);
       println(recorrido.size());

 
    }
   
      // println("dios mio");
//celdaColor(temp.getX(),temp.getY(),0); 
  } moveRandom(temp);

 }

}




/**
**@params Celda c
**@retun String l
** Verificamos que la celda en la que estamos actualmente tenga un moviento 
** Si no tiene un moviento sera tiempo de activar el BackTracking Power 
**/
String sideEnable(Celda c){

String r = " ";

  if(checkMove(c, "l")){
    r = "l";
   
  }else if(checkMove(c, "r")){
    r = "r";
  
  }else if(checkMove(c, "u")){
    r = "u";
  
  }else if(checkMove(c, "d")){
    r = "d";
   
  }else {  
    //celdaColor(c.getX(),c.getY(),0);
 r = "e"; } // Ningun lado disponible
  
return r;  
}





/**
**@Params Celda c, Side lado 
**@return boolean r
**Método verificar si el movimiento deseado es válido o no
**/
boolean checkMove(Celda c, String lado){  
  boolean r = false;
  
  
  if(lado == "l"){  
    if(c.getX() - 30 >= 0 && c.getLeft()){
        if(!biCeldas[c.getX()-30][c.getY()].getVisited()){
       r = true; 
        }else {
     //   println("Quiere mover a un Visado LEFT");
      return false;  }
         
          }else { r =  false; } 
  
  }else if(lado == "r"){
    if(c.getX() + 30 <= 570 && c.getRight()){
      if(!biCeldas[c.getX()+30][c.getY()].getVisited()){

       r =  true;
      } else {
     // println("Quiere mover a un Visado Right"); 
    return false;}
    }else { r =  false;}
       

 
  }else if(lado == "u"){
    if(c.getY() - 30 >= 0 && c.getUp()){
      if(!biCeldas[c.getX()][c.getY()-30].getVisited()){

       r =  true;
      } else{ 
     // println("Quiere mover a un Visado UP");
    return false;}
    }else { r = false;}
    
  

  }else if(lado == "d"){
    if(c.getY() + 30 <= 570 && c.getDown()){
      if(!biCeldas[c.getX()][c.getY()+30].getVisited()){

       r =  true; 
      }else { 
      //println("Quiere mover a un Visado Down"); 
         return false;
            }
    }// If que no salga del mapa
    else { 
        
          return false;
  }


  }
  
   return r;
}







//  MEGA Función Ultra Grande

/**
**@Params Celda c 
**@return
**Método encargado de mover una posición la celda. de manera Aleatoria
**/
Celda moveRandom(Celda c){
  
Celda temp = c;
int si = int(random(0,4));
String side = lados[si];




if(sideEnable(c) != "e"){

   
  
if(side == "l"){ 
   if(checkMove(temp,side)){
    temp.setLeft(false); // Ya no esta diponible 
     borraLine(temp.getX(), temp.getY(),temp.getX(), temp.getY()+k); // Borra Left 
       // Nos movemos a la celda de la izquierda
       temp = biCeldas[temp.getX()-k][temp.getY()];
        // Al mover una celda la celda contigua automanticamente tambien pierde un lado
         temp.setRight(false);
           // Iluminamos esa celda
             celdaColor(temp.getX(),temp.getY(),temp.getColor());
                // La marcamos como vistada
                   temp.setVisited(true);
                     // insertamos al stack el movimiento
                          recorrido.add(temp);
    return temp;
   }else {      
     return temp;
  // println("Moviento no permitodo, necesitamos otro"); 
}
 
  
}else if(side == "r"){
  if(checkMove(temp,side)){
     temp.setRight(false);
     borraLine(temp.getX()+k, temp.getY(),temp.getX()+k, temp.getY()+k); // Borra Right
     temp = biCeldas[temp.getX()+k][temp.getY()];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setLeft(false);
     temp.setVisited(true);
     recorrido.add(temp);
    return temp;
  } else {   
    return temp;
//  println("Moviento no permitodo, necesitamos otro"); 
}
   
   
   
}else if(side == "u"){
  if(checkMove(temp,side)){
     temp.setUp(false); // Ya no esta diponible 
       borraLine(temp.getX(), temp.getY(),temp.getX()+k, temp.getY()); // Borra Up
        // Nos movemos a la celda de arriba
         temp = biCeldas[temp.getX()][temp.getY()-k];
         // Al mover una celda la celda contigua automanticamente tambien pierde un lado
           temp.setDown(false);
         // Iluminamos la celda 
           celdaColor(temp.getX(),temp.getY(),temp.getColor());
           // Actualizamos su estado a vistado : true
             temp.setVisited(true);
             // insertamos al stack el movimiento actual
                recorrido.add(temp);
    return temp;
  }else {     
    return temp;
  //println("Moviento no permitodo, necesitamos otro");
  }

   
    
    
}else if(side == "d"){
 if(checkMove(temp,side)){
     temp.setDown(false);
     borraLine(temp.getX(), temp.getY()+k,temp.getX()+k, temp.getY()+k); // Borra Down
     temp = biCeldas[temp.getX()][temp.getY()+k];
     temp.setUp(false);
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setVisited(true);
     recorrido.add(temp);
    return temp;
   }else{ 
     

   //println("Necesitamos otro moviento " +sideEnable(temp)); 


   
 }
       return temp;

  
} // End else if
else{ 
     
    }

 
} // End IF 
  else{ println("dios ");
  }
 
 
     return temp;


  
} // END MoveRandom







/**
**@Params int x, int y, int z, int w
**@return void
** Función que borra un lado de la celda. 
**/
void borraLine(int x,int y,int z,int w){
stroke(250,250,250);
line(x,y,z,w);
noStroke();
}



// Ejemplos particulares
void celdaColor(int x,int y, int c){
  noStroke();
  //fill(c,int(random(0,250)),int(random(0,250))); // una malla colorida :D
  fill(c,200,210); // Una base en ROJO
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
// Evita que selecciona al azar los bordes del mapa
  if(temp.getX() == 600 || temp.getY() == 600){ 
    //println("No queremos los bordes");
      temp = celdas.get(0);
  }

temp.setColor(250); // Actualizamos el color a Rojo... (tiene sus razones)
temp.setVisited(true); // Vistado = True
recorrido.add(temp); // Metemoa a la pila Para luego hacer backtraking
celdaColor(temp.getX(), temp.getY(),temp.getColor()); // Iluminamos la celda 

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

