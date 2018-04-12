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
    
    public String GetKey() {
      return valueKey;
    }
    
    public void Update(int Value) {
      value = Value;
    }
    
    public boolean IsTrigger() {
      if(mode.indexOf("=") != -1) {
        if(value == threshold) return true;
      }
      if(mode.indexOf("<") != -1) {
        if(value < threshold) return true;
      }
      if(mode.indexOf(">") != -1) {
        if(value > threshold) return true;
      }
      
      return false;
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
    
    public String GetKey() {
      return valueKey;
    }
    
    public void Update(float Value) {
      value = Value;
    }
    
    public boolean IsTrigger() {
      if(mode.indexOf("=") != -1) {
        if(value == threshold) return true;
      }
      if(mode.indexOf("<") != -1) {
        if(value < threshold) return true;
      }
      if(mode.indexOf(">") != -1) {
        if(value > threshold) return true;
      }
      
      return false;
    }
    
    public String toString() {
      return "{" + IsTrigger() + ", " + valueKey + ":" + value + mode + threshold + "}";
    }
  }
  public static class Boolean {
    private boolean value;
    private String valueKey;
    
    Boolean(String Key) {
      valueKey = Key;
    }
    
    public String GetKey() {
      return valueKey;
    }
    
    public void Update(boolean Value) {
      value = Value;
    }
    
    public boolean IsTrigger() {
      return value;
    }
    
    public String toString() {
      return "{" + IsTrigger() + ", " + valueKey + ":" + value + "}";
    }
  }
}