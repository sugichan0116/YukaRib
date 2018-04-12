public static class Transition {
  private ArrayList<Trigger.Float> triggerFloats;
  private ArrayList<Trigger.Integer> triggerIntegers;
  private ArrayList<Trigger.Boolean> triggerBooleans;
  private Animation destination;
  final String mode = "||";
  
  Transition() {
    triggerFloats = new ArrayList<Trigger.Float>();
    triggerIntegers = new ArrayList<Trigger.Integer>();
    triggerBooleans = new ArrayList<Trigger.Boolean>();
    destination = null;
  }
  public static Transition Create() {
    return new Transition();
  }
  public Transition Destination(Animation Destination) {
    destination = Destination;
    return this;
  }
  public Transition Trigger(Trigger.Float trigger) {
    triggerFloats.add(trigger);
    return this;
  }
  public Transition Trigger(Trigger.Integer trigger) {
    triggerIntegers.add(trigger);
    return this;
  }
  public Transition Trigger(Trigger.Boolean trigger) {
    triggerBooleans.add(trigger);
    return this;
  }
  
  private boolean IsPair(boolean a, boolean b) {
    return (mode == "&&") ? (a && b) : (a || b);
  }
  
  public boolean IsTransfer() {
    boolean isTrigger = (mode == "&&");
    for(Trigger.Float t : triggerFloats) {
      isTrigger = IsPair(isTrigger, t.IsTrigger());
    }
    for(Trigger.Integer i : triggerIntegers) {
      isTrigger = IsPair(isTrigger, i.IsTrigger());
    }
    for(Trigger.Boolean b : triggerBooleans) {
      isTrigger = IsPair(isTrigger, b.IsTrigger());
    }
    return isTrigger;
  }
  
  public Animation GetDestination() {
    return destination;
  }
  
  public String toString() {
    return "{" + IsTransfer() + "}";
  }
}