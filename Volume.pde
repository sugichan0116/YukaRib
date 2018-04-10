
public static class Volume{
  
  public static class Integer {
    private int value;
    private Limit.Integer limit;
    
    Integer() {
      value = 0;
      limit = Limit.Integer.Create();
    }
    
    public static Integer Create() {
      return new Integer();
    }
    
    private void Validate() {
      if(limit == null) return;
      if(value < limit.Min()) value = limit.Min();
      if(value > limit.Max()) value = limit.Max();
    }
    
    public Integer Limit(Limit.Integer target) {
      limit = target.Copy();
      return this;
    }
    
    public Integer Value(int Value) {
      value = Value;
      Validate();
      return this;
    }
    
    public Integer Add(int Value) {
      value += Value;
      return this;
    }
    
    public Integer Sub(int Value) {
      value -= Value;
      return this;
    }
    
    public int Value() {
      return value;
    }
    
    public String toString() {
      return "{" + limit.Min() + "< " + Value() + " <" + limit.Max() + "}";
    }
  }
  
  public static class Float {
    private float value;
    private Limit.Float limit;
    
    Float() {
      value = 0f;
      limit = Limit.Float.Create();
    }
    
    public static Float Create() {
      return new Float();
    }
    
    private void Validate() {
      if(limit == null) return;
      if(value < limit.Min()) value = limit.Min();
      if(value > limit.Max()) value = limit.Max();
    }
    
    public Float Limit(Limit.Float target) {
      limit = target.Copy();
      return this;
    }
    
    public Float Value(float Value) {
      value = Value;
      Validate();
      return this;
    }
    
    public Float Add(float Value) {
      value += Value;
      return this;
    }
    
    public Float Sub(float Value) {
      value -= Value;
      return this;
    }
    
    public float Value() {
      return value;
    }
    
    public String toString() {
      return "{" + limit.Min() + "< " + Value() + " <" + limit.Max() + "}";
    }
  }
}