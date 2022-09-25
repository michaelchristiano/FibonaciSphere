import com.hamoid.*;

VideoExport videoExport;

float r = 100;
PVector temp;
float theta;
float delta;
float phi;
float goldenRatio = (1 + sqrt(5))/2 - 1;
float ga = goldenRatio*TWO_PI;
int n = 300;
boolean stop = false;
boolean record = false;


ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(1080,1080,P3D);
  background(255);
  
  if(record){
    videoExport = new VideoExport(this, "SpiralSphere.mp4");
    
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }
  
  
  for(int i = 0; i<=n; i++){
    theta = ga*i;
    phi = acos(-1 + 2*i/(float)n);
    //acos(1 - 2*(i+epsilon)/(n-1+2*epsilon));
    points.add(new PVector(r*cos(theta)*sin(phi), r*sin(theta)*sin(phi), r*cos(phi)));
    
  }
  
    
}

void draw() {
  
  //blendMode(A);
  fill(255);
  noStroke();
  background(0);
  
  translate(width/2,height/2);
  //rotateZ(PI/2);
  rotateY(delta);

  scale(2 - cos(delta), 2 - cos(delta), 2 - cos(delta)); 
  
  
  

  
  
  for(PVector v : points){ 
    push();
    translate(v.x,v.y,v.z);
    sphere(1);
    pop();
  
  }
 
  
   
  
  if (record) videoExport.saveFrame();
  
  delta += PI/180;
  if(delta >= TWO_PI){
    delta = 0;
    n+=10;
       
    
    for(int i = 0; i<n-1; i++){
      theta = ga*i;
      phi = acos(-1 + 2*i/(float)n);
      
      if(i<points.size()-1){
        PVector p = points.get(i);
        p.x = r*cos(theta)*sin(phi);
        p.y = r*sin(theta)*sin(phi);
        p.z = r*cos(phi);
      }
      else {
        points.add(new PVector(r*cos(theta)*sin(phi), r*sin(theta)*sin(phi), r*cos(phi)));
      } 
    }      
  } 
}



  
