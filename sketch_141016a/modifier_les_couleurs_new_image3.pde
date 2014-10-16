PImage img;
PImage img2;
float t;
void setup() {
  size(200, 200);
  img = loadImage("sunflower.jpg");
  println(img.width);
  println(img.height);
  img2=createImage(200,200,ARGB);
}

void draw() {
  t=t+0.0025;
 // loadPixels(); 
  // on va aussi utiliser les pixels de l'img 
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      
      // les fonctions red(), green(), et blue() donnent the 3 composantes de couleur d'un pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      // c'est ici que l'on change les couleurs
      // avant de les afficher dans la fenetre
    //  float k=r*(random(0,3));
      float k=r;
      r=3*g%255;
      g=k+2*noise(t);
      b=(k+r)%255;
      // on reforme l'image avec ces nouveaux pixels
      img2.pixels[loc] =  color(r,g,b);          
    }
  }
  img.updatePixels();
  image(img2,0,00);
  img=img2;
  delay(700);
}
