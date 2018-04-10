
public static class Animation extends Volume.Float{
  private PImage[] anime;
  
  //Constructors
  public static Animation Create() {
    return new Animation();
  }
  public Animation Images(PImage[] Anime) {
    anime = Anime;
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
  
  public int GetIndex() {
    return floor(float(anime.length - 1) * NormalizeValue());
  }
  
  public PImage GetImage() {
    return anime[GetIndex()];
  }
  
}