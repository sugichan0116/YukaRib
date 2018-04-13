public static class Limit {
  
  public static class Integer {
    private int min, max;
    
    Integer() {
      Set(0, 0);
    }
    
    Integer(int Max) {
      Set(0, Max);
    }
    
    Integer(int Min, int Max) {
      Set(Min, Max);
    }
    
    public static Integer Create() {
      return new Integer();
    }
    
    public Integer Set(int Min, int Max) {
      min = Min;
      max = Max;
      Validate();
      return this;
    }
    
    private void Validate() {
      if(min > max) {
        int buf = min;
        min = max;
        max = buf;
      }
    }
    
    public Integer Copy() {
      return new Integer(min, max);
    }
    
    public int Min() {
      return min;
    }
    
    public int Max() {
      return max;
    }
    
    public String toString() {
      return "{" + min + " ~ " + max + "}";
    }
  }
  
  public static class Float {
    private float min, max;
    
    Float() {
      Set(0, 0);
    }
    
    Float(float Max) {
      Set(0, Max);
    }
    
    Float(float Min, float Max) {
      Set(Min, Max);
    }
    
    public static Float Create() {
      return new Float();
    }
    
    private Float Set(float Min, float Max) {
      min = Min;
      max = Max;
      Validate();
      return this;
    }
    
    private void Validate() {
      if(min > max) {
        float buf = min;
        min = max;
        max = buf;
      }
    }
    
    public Float Copy() {
      return new Float(min, max);
    }
    
    public float Min() {
      return min;
    }
    
    public float Max() {
      return max;
    }
    
    public String toString() {
      return "{" + min + " ~ " + max + "}";
    }
  }
}