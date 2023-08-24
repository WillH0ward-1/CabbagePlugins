<Cabbage>
form caption("Formant Synth"), size(765, 650), guiMode("queue"), colour(129, 129, 129), pluginId("talk")

combobox bounds(500, 10, 210, 25), channel("presetComboBox"), items("Default")
button bounds(500, 45, 100, 25), channel("saveNewPresetButton"), text("Save as New Preset")
button bounds(610, 45, 100, 25), channel("deletePresetButton"), text("Delete Preset")

label bounds(10, 10, 200, 20), text("Formant Synthesizer"), fontColour(255, 255, 255, 255), font("default", 16)

button bounds(540, 335, 150, 25), channel("toggleEnvelope"), text("Envelope: OFF"), latched(1)

button bounds(90, 80, 90, 50), channel("toggleInstrument"), text("Loop: OFF"), latched(1)  ; x-axis size decreased to 90 and y-axis increased to 30; moved up by 5
rslider bounds(180, 70, 60, 60), channel("tune"), range(-42, 42, 0), text("Tune"), trackerColour(0, 0, 255, 255)
rslider bounds(240, 70, 60, 60), channel("fineTune"), range(-1, 1, 0), text("Fine-Tune"), trackerColour(0, 0, 255, 255)  ; moved left by 15 and up by 5
rslider bounds(300, 70, 60, 60), channel("lfoFrequency"), range(0.1, 10, 1), text("LFO Frequency"), trackerColour(0, 0, 255, 255)
rslider bounds(360, 70, 60, 60), channel("lfoDepth"), range(0, 1, 0.5), text("LFO Depth"), trackerColour(0, 0, 255, 255)
rslider bounds(420, 70, 60, 60), channel("lfoWaveform"), range(0, 3, 0, 1, 0.001), text("LFO Waveform"), trackerColour(0, 0, 255, 255)

plant("NoiseAmount") {
    groupbox bounds(540, 90, 220, 40), text("Noise Amount"), colour(200, 200, 200)
    hslider bounds(550, 110, 200, 20), channel("noiseAmountSlider"), range(0, 1, 0.5), text("Breathiness") trackerColour(0, 0, 255, 255)
}


plant("WaveformDisplay") {
    groupbox bounds(90, 135, 220, 220), text("Waveform Display"), colour(200, 200, 200)  ; increased height slightly to accommodate combobox
    signaldisplay bounds(100, 185, 200, 160), colour("green") displayType("waveform"), backgroundColour(0, 0, 0), zoom(-1), signalVariable("displaySignal"), channel("display")
    combobox bounds(100, 160, 200, 20), channel("displayCombo"), items("Waveform", "Spectroscope", "Spectrogram", "Lissajous")
}

plant("XYPad") {
    groupbox bounds(315, 135, 220, 190), text("XYPad"), colour(200, 200, 200)
    xypad bounds(325, 155, 200, 160), channel("xCoordinate", "yCoordinate")
}

plant("Formants") {
    groupbox bounds(90, 365, 220, 190), text("Formants"), colour(200, 200, 200)
    vslider bounds(126, 390, 25, 150), channel("kFreq1"), range(0.001, 1000, 300, 1, 0.001), text("F1") trackerColour(0, 67, 210, 255) textColour(255, 255, 255, 255)
    vslider bounds(187, 390, 25, 150), channel("kFreq2"), range(0.001, 1000, 870, 1, 0.001), text("F2") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    vslider bounds(248, 390, 25, 150), channel("kFreq3"), range(0.001, 2500, 2250, 1, 0.001), text("F3") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
}

plant("Bandwidth") {
    groupbox bounds(315, 335, 220, 190), text("Bandwidth"), colour(200, 200, 200)
    hslider bounds(325, 355, 210, 25), channel("kBW1"), range(0.001, 500, 60), text("BW1") trackerColour(0, 0, 255, 255)
    hslider bounds(325, 385, 210, 25), channel("kBW2"), range(0.001, 500, 90), text("BW2") trackerColour(0, 0, 255, 255)
    hslider bounds(325, 415, 210, 25), channel("kBW3"), range(0.001, 500, 200), text("BW3") trackerColour(0, 0, 255, 255)
}

plant("ADSR") {
    groupbox bounds(540, 135, 220, 190), text("ADSR"), colour(200, 200, 200)
    hslider bounds(550, 155, 200, 25), channel("envAttack"), range(0.3, 1, 0.01), text("Attack") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 185, 200, 25), channel("envDecay"), range(0.3, 1, 0.5), text("Decay") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 215, 200, 25), channel("envSustain"), range(0.3, 1, 0.5), text("Sustain") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 245, 200, 25), channel("envRelease"), range(0.001, 1, 0.7), text("Release") trackerColour(0, 0, 255, 255)
}

plant("FilterADSR") {
    groupbox bounds(540, 365, 220, 190), text("Filter ADSR"), colour(200, 200, 200)
    hslider bounds(550, 385, 200, 25), channel("filtAttack"), range(0.001, 1, 0.01), text("Attack") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 415, 200, 25), channel("filtDecay"), range(0.001, 1, 0.5), text("Decay") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 445, 200, 25), channel("filtSustain"), range(0.001, 1, 0.5), text("Sustain") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 475, 200, 25), channel("filtRelease"), range(0.001, 1, 0.7), text("Release") trackerColour(0, 0, 255, 255)
}

plant("Master") {
    groupbox bounds(5, 85, 80, 400), text("Master"), colour(200, 200, 200)
    vslider bounds(20, 105, 50, 375), channel("masterVolume"), range(0, 1, 0.5), text("Vol.") trackerColour(0, 0, 255, 255)
}

keyboard bounds(5, 565, 710, 80)

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n --displays -d -m0d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 2
0dbfs = 1

instr UpdateGUI
    kToggleInstrument chnget "toggleInstrument"
    kTrigInstrument changed kToggleInstrument 

    if kTrigInstrument == 1 then
        if kToggleInstrument == 1 then
            cabbageSet "toggleInstrument", "text", "Drone: ON"
            event "i", "LoopSound", 0, -1 ; Start the LoopSound
        else
            cabbageSet "toggleInstrument", "text", "Drone: OFF"
            turnoff2 "LoopSound", 0, 0.01 ; Stop the LoopSound with a short fade-out time
        endif
    endif

    kToggleEnvelope chnget "toggleEnvelope"
    kTrigEnvelope changed kToggleEnvelope

    if kTrigEnvelope == 1 then
        if kToggleEnvelope == 1 then
            cabbageSet "toggleEnvelope", "text", "Envelope: ON"
        else
            cabbageSet "toggleEnvelope", "text", "Envelope: OFF"
        endif
    endif
endin

instr UpdateDisplay
  
    kDisplayType, kTrig cabbageGetValue "displayCombo"
    STypes[] init 4
    STypes[0] = "waveform"
    STypes[1] = "spectroscope"
    STypes[2] = "spectrogram"
    STypes[3] = "lissajous"
    cabbageSet kTrig, "display", "displayType", STypes[kDisplayType-1]
    
endin


instr LoopSound
   
    aEnv madsr 1, 1, 1, 1
    
    kTune chnget "tune"
    kFineTune chnget "fineTune"
    
    kLFOFreq chnget "lfoFrequency"
    kLFODepth chnget "lfoDepth"
    kLFOWaveform chnget "lfoWaveform"

    kLFO phasor kLFOFreq ; Generate ramp wave ranging from 0 to 
    
    if kLFOWaveform == 0 then
        kLFO oscili kLFODepth, kLFOFreq ; sine waveform
    elseif kLFOWaveform == 1 then
        kLFO oscili kLFODepth, kLFOFreq, 10
    elseif kLFOWaveform == 2 then
        kLFO = (kLFO > 0.5) ? kLFODepth : -kLFODepth ; square waveform
    elseif kLFOWaveform == 3 then
        kLFO = (kLFO * 2 - 1) * kLFODepth ; sawtooth waveform
    endif

    
    kTuneFreq = 440 * pow(2, (kTune + kLFO)/12 + kFineTune/100)

    aLoopSig vco2 1, kTuneFreq

    aLoopSig *= aEnv

    ; Process the signal
    
    kFreq1 chnget "kFreq1"
    kFreq2 chnget "kFreq2"
    kFreq3 chnget "kFreq3"
    kBW1 chnget "kBW1"
    kBW2 chnget "kBW2"
    kBW3 chnget "kBW3"
    kVol chnget "masterVolume"
   
    ; Resonant filters to process the drone based on formant frequencies and bandwidths
    a1 reson aLoopSig, kFreq1, kBW1
    a2 reson aLoopSig, kFreq2, kBW2
    a3 reson aLoopSig, kFreq3, kBW3
    
    a1 *= 1/peak(a1)  ; normalize the amplitude of a1 to 1
    a2 *= 1/peak(a2)  ; normalize the amplitude of a2 to 1
    a3 *= 1/peak(a3)  ; normalize the amplitude of a3 to 1

    aMix = (a1 + a2 + a3) * kVol / 3  ; scale down the combined formants 
    aMixL, aMixR pan2 aMix, 0.5  ; Panning center

    outs aMixL, aMixR ; Output stereo signal
endin


instr MIDI_Listener

    ; Check for MIDI note events
    kStatus, kChan, kData1, kData2 midiin

    ; If a MIDI note-on event (status 144) is detected, trigger FormantSynth
    if (kStatus == 144) then
        iDur = 0.5 ; or whatever duration you want, though it will be overridden by ADSR
        event "i", "FormantSynth", 0, iDur, kData1, kData2
    endif

endin

instr FormantSynth
    ; Automatically capture the MIDI note and velocity from Cabbage's virtual keyboard
    kMidiFreq cpsmidinn p4
    kVel      ampdbfs p5

    kEnv madsr chnget("envAttack"), chnget("envDecay"), chnget("envSustain"), chnget("envRelease")
    kFilterEnv madsr chnget("filtAttack"), chnget("filtDecay"), chnget("filtSustain"), chnget("filtRelease")
    
    kFreq1 chnget "kFreq1"
    kFreq2 chnget "kFreq2"
    kFreq3 chnget "kFreq3"
    kBW1 chnget "kBW1"
    kBW2 chnget "kBW2"
    kBW3 chnget "kBW3"
    kVol chnget "masterVolume"
    
    kToggleEnv chnget "toggleEnvelope" ; get the state of the toggleEnvelope button

    ; Depending on toggleEnvelope, either apply the envelope to the frequency or bypass it
    kMidiFreq = (kToggleEnv == 1 ? kMidiFreq * kFilterEnv : kMidiFreq)
    
    ; Generate the MIDI signal
    aMidiSig vco2 kVel, kMidiFreq
    
    ; Process the MIDI signal
    a1 reson aMidiSig, kFreq1, kBW1
    a2 reson aMidiSig, kFreq2, kBW2
    a3 reson aMidiSig, kFreq3, kBW3

    a1 *= 1/peak(a1)  ; normalize the amplitude of a1 to 1
    a2 *= 1/peak(a2)  ; normalize the amplitude of a2 to 1
    a3 *= 1/peak(a3)  ; normalize the amplitude of a3 to 1

    aMix = (a1 + a2 + a3) * kVol / 3 * kEnv  ; scale down the combined formants 
    aMixL, aMixR pan2 aMix, 0.5  ; panning center
    
    display aMix, .1, 1
    dispfft aMix, .1, 1024
    
    outs aMixL, aMixR
    
endin

instr UpdateFormantsFromXY

    kx chnget "xCoordinate" ; range 0 to 1
    ky chnget "yCoordinate" ; range 0 to 1

    ; Interpolate formant values based on XY positions

    ; Interpolation for X axis (ooo <-> eee)
    kF1_x = 300 + (270-300)*kx
    kF2_x = 870 + (2300-870)*kx
    kF3_x = 2250 + (3000-2250)*kx

    ; Interpolation for Y axis (ooo <-> ahh)
    kF1_y = 300 + (730-300)*ky
    kF2_y = 870 + (2090-870)*ky  ; Adjusted range for kF2_y
    kF3_y = 2250 + (2440-2250)*ky

    ; Final interpolation between the X and Y axis
    kF1 = kF1_x*(1-ky) + kF1_y*ky
    kF2 = kF2_x*(1-ky) + kF2_y*ky
    kF3 = kF3_x*(1-ky) + kF3_y*ky

    ; Set the formant sliders
    cabbageSetValue "kFreq1", kF1
    cabbageSetValue "kFreq2", kF2
    cabbageSetValue "kFreq3", kF3

endin



</CsInstruments>
<CsScore>
f0 z
f 10 0 4096 10 1
i"UpdateGUI" 0 z
i"MIDI_Listener" 0 z
i"UpdateDisplay" 0 z
i"UpdateFormantsFromXY" 0 z

</CsScore>

</CsoundSynthesizer>