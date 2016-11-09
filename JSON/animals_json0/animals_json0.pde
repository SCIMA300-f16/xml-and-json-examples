JSONArray values;

void setup() {

  values = loadJSONArray("animals.json");

  for (int i = 0; i < values.size(); i++) {
    
    JSONObject animal = values.getJSONObject(i); 
    String name = animal.getString("name");
    String species = animal.getString("species");
    int id = animal.getInt("id");

    
    println(id + ", " + species + ", " + name);
  }
}