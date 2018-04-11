public static class Transition {
  private ArrayList<Trigger.Float> triggerFloats;
  private Animation destination;
  
  Transition() {
    triggerFloats = new ArrayList<Trigger.Float>();
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
  
  public boolean IsTransfer() {
    for(Trigger.Float t : triggerFloats) {
      if(t.IsTrigger()) return true;
    }
    return false;
  }
  
  public Animation GetDestination() {
    return destination;
  }
}