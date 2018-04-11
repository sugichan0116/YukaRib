public static class AnimationField {
  private Map<String, Animation> list;
  private String headKey;
  private Map<String, Float> floats;
  //private Map<String, Boolean> Booleans;
  //private Map<String, Integer> Integers;
  
  AnimationField() {
    list = new HashMap<String, Animation>();
    floats = new HashMap<String, Float>();
    headKey = "";
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
  //bool, int
  
  private void Transfer() {
    Animation destination = GetHead().GetDestination();
    if(destination != null) {
      for(String Key: list.keySet()) {
        if(list.get(Key) == destination) headKey = Key; 
      }
    }
  }
  
  public void Update() {
    Transfer();
    for(Animation a : list.values()) {
      for(Transition t : a.list) {
        for(Trigger.Float f : t.triggerFloats) {
          f.Update(floats.get(f.GetKey()));
        }
        //int, bool
      }
    }
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
    return "{" + headKey + "}";
  }
}