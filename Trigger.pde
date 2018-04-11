public static class Trigger {
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
    
  }
}