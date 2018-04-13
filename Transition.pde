public static class Transition {
  private ArrayList<Trigger.Float> triggerFloats;
  private ArrayList<Trigger.Integer> triggerIntegers;
  private ArrayList<Trigger.Boolean> triggerBooleans;
  private Animation destination;
  final String mode = "||";
  private String logText;
  
  Transition() {
    triggerFloats = new ArrayList<Trigger.Float>();
    triggerIntegers = new ArrayList<Trigger.Integer>();
    triggerBooleans = new ArrayList<Trigger.Boolean>();
    destination = null;
    logText = "";
  }
  public static Transition Create() {
    return new Transition();
  }
  public Transition Copy() {
    Transition t = Create().Destination(destination);
    for(Trigger.Float f : triggerFloats) {
      t.Trigger(f.Copy());
    }
    for(Trigger.Integer i : triggerIntegers) {
      t.Trigger(i.Copy());
    }
    for(Trigger.Boolean b : triggerBooleans) {
      t.Trigger(b.Copy());
    }
    return t;
  }
  public Transition Trigger(Transition target) {
    triggerFloats.addAll(target.triggerFloats);
    triggerIntegers.addAll(target.triggerIntegers);
    triggerBooleans.addAll(target.triggerBooleans);
    return this;
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
  public Transition Reverse() {
    for(Trigger.Float t : triggerFloats) {
      t.Reverse();
    }
    for(Trigger.Integer i : triggerIntegers) {
      i.Reverse();
    }
    for(Trigger.Boolean b : triggerBooleans) {
      b.Reverse();
    }
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
  
  private String LogTrigger() {
    String text = "";
    if(IsTransfer()) {
      for(Trigger.Float t : triggerFloats) {
        text += ", " + t;
      }
      for(Trigger.Integer i : triggerIntegers) {
        text += ", " + i;
      }
      for(Trigger.Boolean b : triggerBooleans) {
        text += ", " + b;
      }
    }
    return text;
  }
  
  public String toString() {
    String text = "{Trans:" + IsTransfer() + LogTrigger() + "}";
    return text;
  }
}