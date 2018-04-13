public static class Animation extends Volume.Float{
  private PImage[] anime;
  private ArrayList<Transition> list;
  private boolean isLoop;
  private String logText;
  
  //Constructors
  Animation() {
    anime = null;
    isLoop = false;
    Clear();
    logText = "";
  }
  public static Animation Create() {
    return new Animation();
  }
  public Animation Images(PImage[] Anime) {
    anime = Anime;
    return this;
  }
  public Animation Loop() {
    isLoop = true;
    return this;
  }
  public Animation NoLoop() {
    isLoop = false;
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
    super.Sub(Value);
    return this;
  }
  
  private Boolean IsTransfer() {
    return GetDestination() != null;
  }
  
  public Animation GetDestination() {
    for(Transition t: list) {
      if(t.IsTransfer()) {
        logText += ", " + "trans in " + t;
        return t.GetDestination();
      }
    }
    if(logText == "") {
      for(Transition t: list) {
        logText += ", " + t;
      }
    }
    return null;
  }
  
  public int GetIndex() {
    if(isLoop && IsEnd()) Value(0f);
    return floor(float(anime.length - 1) * GetNormalizeValue());
  }
  
  public PImage GetImage() {
    return anime[GetIndex()];
  }
  
  public String toString() {
    String text = "{Play:" + super.toString() + ", Loop:" + isLoop + logText + "}";
    logText = "";
    return text;
  }
  
}