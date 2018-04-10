/* library */
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

//icon
Map<String, PImage[]> icons;
Image image = new Image();

Limit.Integer limit = Limit.Integer.Create().Set(0, 255);
Volume.Integer str = (new Volume.Integer()).Limit(limit);
Volume.Integer dex = Volume.Integer.Create().Limit(limit).Value(4);
Limit.Float limitMax = Limit.Float.Create().Set(0, 255);
Volume.Float edu = Volume.Float.Create().Limit(limitMax).Value(4f);
Animation ani;

void setup() {
  println("* image loading...");
  icons = new HashMap<String, PImage[]>();
  icons.put("SLIME", image.Slice("slime.png", 32, 32));
  ani = Animation.Create()
    .Images(icons.get("SLIME"))
    .Limit(new Limit.Float(0f, .8f));
}

void draw() {
  ani.Add(1f / frameRate);
  image(ani.GetImage(), 0, 0);
  println("*" + limit + dex);
}