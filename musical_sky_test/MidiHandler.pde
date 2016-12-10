import javax.sound.midi.*; 
import java.util.*; // for lists of MIDI devices obtained by MidiUtils

/*
 * MidiHandler for Processing
 * 
 * Support for simple note on/off functionality for 
 * a single MIDI output device.
 * 
 * Author: Donya Quick
 */
class MidiHandler{
  MidiDevice outDev; // output device
  int defaultVolume = 80; // must be 0 to 127
  
  // initialize the handler with device zero (the default)
  public void initialize() {
    initialize(0);
  }
    
  // initialize with a custom output device index
  public void initialize(int outDevNum) { 
    try {
      List<MidiDevice> outDevs = MidiUtils.getOutputDevices();
      outDev = outDevs.get(outDevNum);
      print(outDev.getDeviceInfo().getName());
      outDev.open();
    } 
    catch (Exception e) {
      println(e.getMessage());
    }
  }
  
  // start playing a pitch
  public void noteOn(int pitchNumber) {
    noteOn(0, pitchNumber, defaultVolume);
  }
  
  // start playing a note on a particular channel with custom volume
  public void noteOn(int channel, int pitchNumber, int volume) {
    MidiUtils.noteOn(outDev, channel, pitchNumber, volume);
  }
  
  // stop playing a pitch
  public void noteOff(int pitchNumber) {
    noteOff(0, pitchNumber, 0);
  }
  
  // stop playing a pitch on a particular channel with custom volume
  public void noteOff(int channel, int pitchNumber, int volume) {
    MidiUtils.noteOn(outDev, channel, pitchNumber, volume);
  }
}