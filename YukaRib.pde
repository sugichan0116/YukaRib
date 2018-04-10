

Limit.Integer limit = Limit.Integer.Create().Set(0, 255);
Volume.Integer str = (new Volume.Integer()).Limit(limit);
Volume.Integer dex = Volume.Integer.Create().Limit(limit).Value(4);
Limit.Float limitMax = Limit.Float.Create().Set(0, 255);
Volume.Float edu = Volume.Float.Create().Limit(limitMax).Value(4f);

void draw() {
  
  println("*" + limit + dex);
}