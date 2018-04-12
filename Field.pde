public static class AnimationField {
  private Map<String, Animation> list;
  private String headKey;
  private Map<String, Float> floats;
  private Map<String, Integer> integers;
  private Map<String, Boolean> booleans;
  private float timeOfFrame;
  
  AnimationField() {
    list = new HashMap<String, Animation>();
    floats = new HashMap<String, Float>();
    integers = new HashMap<String, Integer>();
    booleans = new HashMap<String, Boolean>();
    headKey = "";
    timeOfFrame = 0f;
  }
  public static AnimationField Create() {
    return new AnimationField();
  }
  public AnimationField Head(String Key) {
    headKey = Key;
    return this;
  }
  public AnimationField HeadAnimation(String Key, Animation target) {
    Head(Key);
    return Animation(Key, target);
  }
  public AnimationField Animation(String Key, Animation target) {
    list.put(Key, target);
    return this;
  }
  public AnimationField Float(String Key, Float value) {
    floats.put(Key, value);
    return this;
  }
  public AnimationField Integer(String Key, Integer value) {
    integers.put(Key, value);
    return this;
  }
  public AnimationField Boolean(String Key, Boolean value) {
    booleans.put(Key, value);
    return this;
  }
  public AnimationField Time(float t) {
    timeOfFrame = t;
    return this;
  }
  
  private void Transfer() {
    Animation destination = GetHead().GetDestination();
    if(destination != null) {
      for(String Key: list.keySet()) {
        if(list.get(Key) == destination) headKey = Key; 
      }
    }
  }
  
  public void Update() {
    //timer & parameter update
    for(Animation a : list.values()) {
      for(Transition t : a.list) {
        for(Trigger.Integer i : t.triggerIntegers) {
          i.Update(integers.get(i.GetKey()));
        }
        for(Trigger.Float f : t.triggerFloats) {
          f.Update(floats.get(f.GetKey()));
        }
        for(Trigger.Boolean b : t.triggerBooleans) {
          b.Update(booleans.get(b.GetKey()));
        }
      }
    }
    
    GetHead().Add(timeOfFrame);
    Transfer();
  }
  
  public Animation GetHead() {
    return list.get(headKey);
  }
  
  public int GetIndex() {
    if(GetHead() != null) return GetHead().GetIndex();
    return 0;
  }
  
  public PImage GetImage() {
    if(GetHead() != null) return GetHead().GetImage();
    
    return null;
  }
  
  public String toString() {
    return "{" + headKey + "(" + GetIndex() + ")" + "}";
  }
}