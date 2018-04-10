
public static class Volume{
  
  public static class Integer {
    private int value;
    private Limit.Integer limit;
    
    //Constructors
    Integer() {
      value = 0;
      limit = Limit.Integer.Create();
    }
    public static Integer Create() {
      return new Integer();
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
      Validate();
      return this;
    }
    public Integer Sub(int Value) {
      value -= Value;
      Validate();
      return this;
    }
    
    private void Validate() {
      if(limit == null) return;
      if(value < limit.Min()) value = limit.Min();
      if(value > limit.Max()) value = limit.Max();
    }
    
    public int Value() {
      return value;
    }
    
    public float NormalizeValue() {
      return norm(float(value), limit.Min(), limit.Max());
    }
    
    public String toString() {
      return "{" + limit.Min() + "< " + Value() + " <" + limit.Max() + "}";
    }
  }
  
  public static class Float {
    private float value;
    private Limit.Float limit;
    
    //Constructors
    Float() {
      value = 0f;
      limit = Limit.Float.Create();
    }
    public static Float Create() {
      return new Float();
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
      Validate();
      return this;
    }
    public Float Sub(float Value) {
      value -= Value;
      Validate();
      return this;
    }
    
    private void Validate() {
      if(limit == null) return;
      if(value < limit.Min()) value = limit.Min();
      if(value > limit.Max()) value = limit.Max();
    }
    
    public float Value() {
      return value;
    }
    
    public float NormalizeValue() {
      return norm(value, limit.Min(), limit.Max());
    }
    
    public String toString() {
      return "{" + limit.Min() + "< " + Value() + " <" + limit.Max() + "}";
    }
  }
}