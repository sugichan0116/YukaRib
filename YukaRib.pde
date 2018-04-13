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
Volume.Float eat;
Transition t = (new Transition()).Trigger(new Trigger.Float("EAT", ">=", 1f)), s;

void setup() {
  println("* image loading...");
  icons = new HashMap<String, PImage[]>();
  icons.put("SLIME_RIGHT", image.Slice("slime2.png", 32, 32, 2, 2));
  icons.put("SLIME_LEFT", image.Slice("slime2.png", 32, 32, -2, 2));
  icons.put("SLIME_DOWN", image.Slice("slime_b.png", 32, 32, 2, 2));
  icons.put("SLIME_UP", image.Slice("slime_a.png", 32, 32, 2, 2));
  icons.put("SLIME_EAT", image.Slice("slime_e.png", 32, 32, 2, 2));
  icons.put("EAT", image.Slice("slime_e.png", 32, 32, 4, 4));
  
  eat = (new Volume.Float()).Limit(new Limit.Float(3f));
  slime = (new AnimationField())
    .Boolean("RIGHT", false)
    .Boolean("LEFT", false)
    .Boolean("UP", false)
    .Boolean("DOWN", false)
    .Float("EAT", 0f)
    .HeadAnimation("IDLE", (new Animation()).Images(icons.get("SLIME_RIGHT")).Limit(new Limit.Float()))
    .Animation("RIGHT", (new Animation()).Images(icons.get("SLIME_RIGHT")).Limit(new Limit.Float(1f)).Loop())
    .Animation("LEFT", (new Animation()).Images(icons.get("SLIME_LEFT")).Limit(new Limit.Float(1.5f)).Loop())
    .Animation("UP", (new Animation()).Images(icons.get("SLIME_UP")).Limit(new Limit.Float(1.2f)).Loop())
    .Animation("DOWN", (new Animation()).Images(icons.get("SLIME_DOWN")).Limit(new Limit.Float(1.7f)).Loop())
    .Animation("EAT", (new Animation()).Images(icons.get("SLIME_EAT")).Limit(new Limit.Float(2.0f)))
    .BiTransition("IDLE", "LEFT", (new Transition()).Trigger(new Trigger.Boolean("LEFT")))
    .BiTransition("IDLE", "RIGHT", (new Transition()).Trigger(new Trigger.Boolean("RIGHT")))
    .BiTransition("IDLE", "UP", (new Transition()).Trigger(new Trigger.Boolean("UP")))
    .BiTransition("IDLE", "DOWN", (new Transition()).Trigger(new Trigger.Boolean("DOWN")))
    .BiTransition("IDLE", "EAT", t);
}

void draw() {
  background(255);
  if(mousePressed) eat.Max();
  eat.Sub(1f / frameRate);
  
  slime.Time(1f / frameRate)
    .Boolean("RIGHT", keyCode == RIGHT)
    .Boolean("LEFT", keyCode == LEFT)
    .Boolean("UP", keyCode == UP)
    .Boolean("DOWN", keyCode == DOWN)
    .Float("EAT", eat.GetValue())
    .Update();
  image(slime.GetImage(), 0, 0);
  println("*" + slime);
}