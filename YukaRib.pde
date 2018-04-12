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
AnimationField slime;
Animation ani, eat;
int a;
Transition t;

void setup() {
  println("* image loading...");
  icons = new HashMap<String, PImage[]>();
  icons.put("SLIME", image.Slice("slime.png", 32, 32, 4, 4));
  icons.put("EAT", image.Slice("slime_e.png", 32, 32, 4, 4));
  
  Transition[] tra = new Transition[8];
  Trigger.Float tri = new Trigger.Float("EAT", ">=", .5f);
  Trigger.Float tri2 = new Trigger.Float("WALK", ">=", .5f);
  tra[0] = Transition.Create().Trigger(tri2);
  tra[1] = Transition.Create().Trigger(tri);
  tra[2] = Transition.Create().Trigger(tri2);
  ani = Animation.Create()
    .Images(icons.get("SLIME"))
    .Limit(new Limit.Float(0f, .8f));
  eat = Animation.Create()
    .Images(icons.get("EAT"))
    .Limit(new Limit.Float(0f, 2.2f));
  ani.Transition(tra[0].Destination(ani))
    .Transition(tra[1].Destination(eat));
  eat.Transition(tra[2].Destination(ani));
  slime = AnimationField.Create()
    .HeadAnimation("WALKING", ani)
    .Animation("EATING", eat)
    .Float("EAT", 0f)
    .Float("WALK", 0f);
}

void draw() {
  background(255);
  slime.Time(1f / frameRate)
    .Float("EAT", (mousePressed) ? 1f : 0f)
    .Update();
  image(slime.GetImage(), 0, 0);
  println("*" + slime + slime.floats.get("EAT") + ani.list.get(1).triggerFloats.get(0));
}