public static class Trigger {
  public static class Integer {
    private int value, threshold;
    private String mode;
    private String valueKey;
    
    Integer(String Key, String Mode, int Threshold) {
      valueKey = Key;
      mode = Mode;
      threshold = Threshold;
    }
    public Integer Reverse() {
      String Mode = "";
      String[] operators = {"=", "<", ">"};
      for(String o : operators) {
        if(mode.indexOf(o) == -1) Mode += o;
      }
      mode = Mode;
      return this;
    }
    public Integer Copy() {
      return (new Integer(valueKey, mode, threshold));
    }
    
    public String GetKey() {
      return valueKey;
    }
    
    public void Update(int Value) {
      value = Value;
    }
    
    public boolean IsTrigger() {
      boolean result = false;
      if(mode.indexOf("=") != -1) {
        if(value == threshold) result = true;
      }
      if(mode.indexOf("<") != -1) {
        if(value < threshold) result = true;
      }
      if(mode.indexOf(">") != -1) {
        if(value > threshold) result = true;
      }
      
      return result;
    }
    
    public String toString() {
      return "{" + IsTrigger() + ", " + valueKey + ":" + value + mode + threshold + "}";
    }
  }
  public static class Float {
    private float value, threshold;
    private String mode;
    private String valueKey;
    
    Float(String Key, String Mode, float Threshold) {
      valueKey = Key;
      mode = Mode;
      threshold = Threshold;
    }
    public Float Reverse() {
      String Mode = "";
      String[] operators = {"=", "<", ">"};
      for(String o : operators) {
        if(mode.indexOf(o) == -1) Mode += o;
      }
      mode = Mode;
      return this;
    }
    public Float Copy() {
      return (new Float(valueKey, mode, threshold));
    }
    
    public String GetKey() {
      return valueKey;
    }
    
    public void Update(float Value) {
      value = Value;
    }
    
    public boolean IsTrigger() {
      boolean result = false;
      if(mode.indexOf("=") != -1) {
        if(value == threshold) result = true;
      }
      if(mode.indexOf("<") != -1) {
        if(value < threshold) result = true;
      }
      if(mode.indexOf(">") != -1) {
        if(value > threshold) result = true;
      }
      
      return result;
    }
    
    public String toString() {
      return "{" + IsTrigger() + ", " + valueKey + ":" + value + mode + threshold + "}";
    }
  }
  public static class Boolean {
    private boolean value;
    private boolean isReverse;
    private String valueKey;
    
    Boolean(String Key) {
      this(Key, false);
      isReverse = false;
    }
    Boolean(String Key, boolean Reverse) {
      valueKey = Key;
      isReverse = Reverse;
    }
    public Boolean Reverse() {
      isReverse = !isReverse;
      return this;
    }
    public Boolean Copy() {
      return (new Boolean(valueKey, isReverse));
    }
    
    public String GetKey() {
      return valueKey;
    }
    
    public void Update(boolean Value) {
      value = Value;
    }
    
    public boolean IsTrigger() {
      return value ^ isReverse;
    }
    
    public String toString() {
      return "{" + IsTrigger() + ", " + valueKey + ":" + value + "(R:" + isReverse + ")}";
    }
  }
}