ArrayList<Celda> celdas; // Conjunto con todas las CELDAS o.o
ArrayList<Celda> recorrido; // Movimientos realizados, (STACK)
String[] lados = {"l","r","u","d"}; // Movimientos posibles

PrintWriter Save;

int k=30,n=5;

void setup(){
Save = createWriter("laberinto.txt"); 
background(120,120,120);
recorrido = new ArrayList<Celda>();
celdas = new ArrayList<Celda>();
//noLoop();
//int k=40,n=20;
size(n*k+10,n*k+10);
frameRate(6);
      frame.setTitle("Laberinto Cool de " +k + " por " + n); 
       Save.println(k+" "+ n);
}

boolean spamclickfukingyourself = true;
Celda salida = new Celda(0,0,false,false,0); // La salida mas cercana.
//int k=40,n=20;
// Celdas Iniciales
Celda[][] biCeldas = new Celda[(k*n)+1][(k*n)+1];



void draw(){
//int k=40,n=20;

if( spamclickfukingyourself){
for (int x=0;x<=(k*n);x=x+k){
   for (int y=0;y<=(k*n);y=y+k){
        //Inicializando las celdas las vamos insertando en el arrelgo "celdas"
     celdas.add(new Celda(x,y,false , false, int(random(0,250))));
        biCeldas[x][y] = new Celda(x,y,false , false, 250);
     if(x!=k*n){
       strokeWeight(2);
          line(x,y,x+k,y);
            }
      if(y!=k*n){
          line(x,y,x,y+k);
      }    
   }
}

}// END SPAMCLIKFUKINGYOURSELF

    if (mousePressed == true) {
      loop();
  // Evitar que este entrando constatemente solo queremos que initRandom corra una vez
  if(spamclickfukingyourself){
    
   Celda temp = initRandom();
   spamclickfukingyourself = false;
   //mientras se pueda recorrer las celdas   
     while(sideEnable(temp) != "e"){
 temp = moveRandom(temp);
  }
  
  // llegamos a una posicion sin salida tenemos que hacer BackTracking
  backTraking(temp); 
  
  } // END SPAMCLIKFUKINGYOURSELF
  
  // Cuando ya entreo initRandom()
  else{
     Celda temp = salida;
       while(sideEnable(temp) != "e"){
 temp = moveRandom(temp);
  } // END WHILE
  backTraking(temp); 
  

  } // END ELSE

} // End   mouseButton = LEFT
 else if (mouseButton == RIGHT) {
   noLoop();
   println("No more LOOP");
  } else {}


} // END DRAW 



// Gastando memoria a lo loco 
void mousePressed(){
    loop();  
}// END  MOUSEPRESED()




/**
**@params 
**@return PrintWriter Save
** Función que se encargara de guardar en un archivo de texto
** el resulto final - Que es nuestro laberinto
**/
void keyPressed(){
 
  if(key == CODED){
     if(keyCode  == UP){   
        Save.flush();
        Save.close();
       
      }
   }

  
  
}




/** 
**@params Celda
**@return void
** Backtraking Power, Aqui es donde empieza la magia, cuando nuestra función 
** initRando() se queda atascada, entra BackTraking y empieza a buscar salidas posibles 
** para que initRandom puede seguir moviendose
** Eventulamente no se podra mover más y eso es cuando el arreglo de "Recorridos" - Stack
** ya o tiene elementos.
**/
void backTraking(Celda c){
 // println(recorrido.size());
  Celda temp = c;
  celdaColor(temp.getX(),temp.getY(),0); 

 if(recorrido.size() != 0){
  for(int i = recorrido.size()-1;i>0;i--){
    if(sideEnable(recorrido.get(i)) != "e"){
      temp = recorrido.get(i);
       celdaColor(temp.getX(),temp.getY(),190);
         salida = temp;
          
           // println(recorrido.get(i).toString());
           // Save.println(recorrido.get(i).toSalida());

           break;
          }else{  
             //println(recorrido.get(i).toString());
                  Save.println(recorrido.get(i).toSalida());
        Celda bar = recorrido.get(i);
        Celda foo = biCeldas[bar.getX()][bar.getY()];
         foo.setVisited(true);
         biCeldas[bar.getX()][bar.getY()] = foo;

            celdaColor(recorrido.get(i).getX(),recorrido.get(i).getY(),0);
         recorrido.remove(i);
         
 
    }
   
  } 
  
  moveRandom(temp);

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
    if(c.getX() - k >= 0 && c.getLeft()){
        if(!biCeldas[c.getX()-k][c.getY()].getVisited()){
       r = true; 
        }else {
     //   println("Quiere mover a un Visado LEFT");
      return false;  }
         
          }else { r =  false; } 
  
  }else if(lado == "r"){
    if(c.getX() + k <= ((n*k)-k) && c.getRight()){
      if(!biCeldas[c.getX()+k][c.getY()].getVisited()){

       r =  true;
      } else {
     // println("Quiere mover a un Visado Right"); 
    return false;}
    }else { r =  false;}
       

 
  }else if(lado == "u"){
    if(c.getY() - k >= 0 && c.getUp()){
      if(!biCeldas[c.getX()][c.getY()-k].getVisited()){

       r =  true;
      } else{ 
     // println("Quiere mover a un Visado UP");
    return false;}
    }else { r = false;}
    
  

  }else if(lado == "d"){
    if(c.getY() + k <= ((n*k)-k) && c.getDown()){
      if(!biCeldas[c.getX()][c.getY()+k].getVisited()){

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
     temp.setVisited(true);// POr aquello de las malditas dudas
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
}
 
  
}else if(side == "r"){
  if(checkMove(temp,side)){
     temp.setRight(false);
       temp.setVisited(true);// POr aquello de las malditas dudas

     borraLine(temp.getX()+k, temp.getY(),temp.getX()+k, temp.getY()+k); // Borra Right
     temp = biCeldas[temp.getX()+k][temp.getY()];
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setLeft(false);
     temp.setVisited(true);
     recorrido.add(temp);
    return temp;
  } else {   
    return temp;
}
   
   
   
}else if(side == "u"){
  if(checkMove(temp,side)){
     temp.setUp(false); // Ya no esta diponible 
          temp.setVisited(true);// POr aquello de las malditas dudas

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
  }

   
    
    
}else if(side == "d"){
 if(checkMove(temp,side)){
     temp.setDown(false);
          temp.setVisited(true);// POr aquello de las malditas dudas

     borraLine(temp.getX(), temp.getY()+k,temp.getX()+k, temp.getY()+k); // Borra Down
     temp = biCeldas[temp.getX()][temp.getY()+k];
     temp.setUp(false);
     celdaColor(temp.getX(),temp.getY(),temp.getColor());
     temp.setVisited(true);
     recorrido.add(temp);
    return temp;
   }else{ 
     
 
 }
       return temp;

  
} // End elseif


 
} // End IF 
  else{ println("No hay movimientos disponibles ");
  }
 
 
     return temp;


  
} // END MoveRandom







/**
**@Params int x, int y, int z, int w
**@return void
** Función que borra un lado de la celda. 
**/
void borraLine(int x,int y,int z,int w){

stroke(0,190,190);
line(x,y,z,w);

}



// Ejemplos particulares
void celdaColor(int x,int y, int c){
 
  noStroke();
  fill(c,190,190); // Una base en ROJO
  rect(x+1,y+1,k-2,k-2);

}


/**@Params 
**@Return void
** función Inicial la cual posicionara una celda en una localidad random
**/
Celda initRandom(){
 int i = int(random(0,celdas.size()));
  
Celda temp = celdas.get(i);
// Evita que selecciona al azar los bordes del mapa
  if(temp.getX() == (n*k) || temp.getY() == (n*k)){ 
    //println("No queremos los bordes");
      temp = celdas.get(0);
  }

temp.setColor(250); // Actualizamos el color a Rojo... (tiene sus razones)
temp.setVisited(true); // Vistado = True
recorrido.add(temp); // Metemoa a la pila Para luego hacer backtraking
celdaColor(temp.getX(), temp.getY(),temp.getColor()); // Iluminamos la celda 

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


/**
**@params 
**@return String
**/
String toSalida(){
   // Lados 
  int left = (this.Left)? 1: 0;
  int right = (this.Right)? 1 : 0;
  int down =  (this.Down ) ? 1 : 0;
  int up = (this.Up)? 1 :0;
  
return (x +" " + y+" "+left +" "+right+" "+up+" "+down); 
}
   
}

