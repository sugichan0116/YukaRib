public static class Animation extends Volume.Float{
  private PImage[] anime;
  private ArrayList<Transition> list;
  
  //Constructors
  Animation() {
    anime = null;
    Clear();
  }
  public static Animation Create() {
    return new Animation();
  }
  public Animation Images(PImage[] Anime) {
    anime = Anime;
    return this;
  }
  public Animation Clear() {
    list = new ArrayList<Transition>();
    return this;
  }
  public Animation Transition(Transition target) {
    list.add(target);
    return this;
  }
  public Animation Limit(Limit.Float target) {
    super.Limit(target);
    return this;
  }
  public Animation Value(float Value) {
    super.Value(Value);
    return this;
  }
  public Animation Add(float Value) {
    super.Add(Value);
    return this;
  }
  public Animation Sub(float Value) {
    super.Add(Value);
    return this;
  }
  
  public Animation GetDestination() {
    for(Transition t: list) {
      if(t.IsTransfer()) return t.GetDestination();
    }
    
    return null;
  }
  
  public int GetIndex() {
    return floor(float(anime.length - 1) * GetNormalizeValue());
  }
  
  public PImage GetImage() {
    return anime[GetIndex()];
  }
  
}