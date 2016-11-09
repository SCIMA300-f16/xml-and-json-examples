XML cambridge;

int[] lows = new int[0];
int[] highs = new int[0];

void setup(){
  size(700,700);
 cambridge = loadXML("weather.xml");
 lows = getData(cambridge, "minimum");
 highs = getData(cambridge, "maximum");
}

void draw(){
 background(204);
 noStroke();
 fill(0);
 beginShape(QUAD_STRIP);
 for(int i = 0; i<lows.length; i++){
  float x = map(i, 0, lows.length-1, 0, width);
  vertex(x, height-lows[i]);
  vertex(x, height-highs[i]*2);
 }
 endShape();
 stroke(255,153);
 for(int y = height-1; y>0; y-=10){
  line(0,y,width,y); 
 }
  
}
 
 int[] getData(XML city, String minOrMax){
  int[] values = new int[0]; 
 for(XML temps : city.getChildren("temperature")){
  String type = temps.getString("type");
  if(type.equals(minOrMax)){
   for (XML val : temps.getChildren("value")){
    int t  = int(val.getContent());
    values = append(values, t);
   }
  }
   
 }
 return values;
 }

 