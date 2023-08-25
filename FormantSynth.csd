<Cabbage>
form caption("Formant Synth"), size(765, 650), colour(129, 129, 129), pluginId("talk")

combobox bounds(500, 10, 210, 25), channel("presetComboBox"), items("Default")
button bounds(500, 45, 100, 25), channel("saveNewPresetButton"), text("Save as New Preset")
button bounds(610, 45, 100, 25), channel("deletePresetButton"), text("Delete Preset")

label bounds(10, 10, 200, 20), text("Formant Synthesizer"), fontColour(255, 255, 255, 255), font("default", 16)

button bounds(540, 335, 150, 25), channel("toggleEnvelope"), text("Envelope: OFF"), latched(1)

button bounds(90, 80, 90, 50), channel("toggleInstrument"), identChannel("toggleInstrumentID"), text("Loop: OFF"), latched(1) 
rslider bounds(180, 70, 60, 60), channel("tune"), range(-24, 24, 0), text("Tune"), trackerColour(0, 0, 255, 255)
rslider bounds(240, 70, 60, 60), channel("fineTune"), range(-1, 1, 0), text("Fine-Tune"), trackerColour(0, 0, 255, 255)  
rslider bounds(300, 70, 60, 60), channel("lfoFrequency"), range(0.1, 10, 1), text("LFO Frequency"), trackerColour(0, 0, 255, 255)
rslider bounds(360, 70, 60, 60), channel("lfoDepth"), range(0, 1, 0.5), text("LFO Depth"), trackerColour(0, 0, 255, 255)
rslider bounds(420, 70, 60, 60), channel("lfoWaveform"), range(0, 3, 0, 1, 0.001), text("LFO Waveform"), trackerColour(0, 0, 255, 255)

rslider bounds(480, 70, 60, 60), channel("emotion"), range(0, 1, 0), text("Emotion"), trackerColour(0, 0, 255, 255)

plant("NoiseAmount") {
    groupbox bounds(540, 90, 220, 40), text("Noise Amount"), colour(200, 200, 200)
    hslider bounds(550, 110, 200, 20), channel("noiseAmountSlider"), range(0, 1, 0.5), text("Breathiness") trackerColour(0, 0, 255, 255)
}

combobox bounds(10, 35, 210, 25), channel("voiceTypeComboBox"), items("Soprano: C4-A5", "Mezzo soprano: A3-F5", "Alto: F3-D5", "Tenor: B2-G4", "Baritone: G2-E4", "Bass: E2-C4")


plant("WaveformDisplay") {
    groupbox bounds(90, 135, 220, 220), text("Waveform Display"), colour(200, 200, 200) 
    signaldisplay bounds(100, 185, 200, 160), colour("green") displayType("waveform"), backgroundColour(0, 0, 0), zoom(-1), signalVariable("displaySignal"), channel("display")
    combobox bounds(100, 160, 200, 20), channel("displayCombo"), items("Waveform", "Spectroscope", "Spectrogram", "Lissajous")
}

button bounds(325, 140, 80, 25), channel("autoVowel"), text("AutoVowel")

plant("XYPad") {
    groupbox bounds(315, 170, 220, 190), text("XYPad"), colour(200, 200, 200)
    xypad bounds(325, 190, 200, 160), channel("xCoordinate", "yCoordinate")
}

hslider bounds(325, 360, 210, 25), channel("autoSpeed"), range(-1, 1, 0), text("AutoSpeed") trackerColour(0, 0, 255, 255)


plant("Formants") {
    groupbox bounds(90, 365, 220, 190), text("Formants"), colour(200, 200, 200)
    vslider bounds(126, 390, 25, 150), channel("kFreq1"), range(0.0001, 4000, 300, 1, 0.001), text("F1") trackerColour(0, 67, 210, 255) textColour(255, 255, 255, 255)
    vslider bounds(187, 390, 25, 150), channel("kFreq2"), range(0.0001, 4000, 870, 1, 0.001), text("F2") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    vslider bounds(248, 390, 25, 150), channel("kFreq3"), range(0.0001, 4000, 2250, 1, 0.001), text("F3") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
}

plant("Bandwidth") {
    ; Bounds updated: position moved down and made smaller on the Y-axis
    groupbox bounds(315, 390, 220, 135), text("Bandwidth"), colour(200, 200, 200)
    hslider bounds(325, 410, 210, 25), channel("kBW1"), range(0.001, 500, 60), text("BW1") trackerColour(0, 0, 255, 255)
    hslider bounds(325, 440, 210, 25), channel("kBW2"), range(0.001, 500, 90), text("BW2") trackerColour(0, 0, 255, 255)
    hslider bounds(325, 470, 210, 25), channel("kBW3"), range(0.001, 500, 200), text("BW3") trackerColour(0, 0, 255, 255)
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
    ; Handling toggleInstrument
    kToggleInstrument chnget "toggleInstrument"
    kTrigInstrument changed kToggleInstrument 

    if kTrigInstrument == 1 then
        if kToggleInstrument == 1 then
            chnset "text(\"Drone: ON\")", "toggleInstrumentID"
            event "i", "LoopSound", 0, -1 ; Start the LoopSound
        else
            chnset "text(\"Drone: OFF\")", "toggleInstrumentID"
            turnoff2 "LoopSound", 0, 0.01 ; Stop the LoopSound with a short fade-out time
        endif
    endif

    ; Handling toggleEnvelope
    kToggleEnvelope chnget "toggleEnvelope"
    kTrigEnvelope changed kToggleEnvelope

    if kTrigEnvelope == 1 then
        if kToggleEnvelope == 1 then
            chnset "text(\"Envelope: ON\")", "toggleEnvelopeID"
        else
            chnset "text(\"Envelope: OFF\")", "toggleEnvelopeID"
        endif
    endif
    
    ; Handling emotion-related updates
    kEmotionPrev init 0
    kEmotionCurr chnget "emotion"
    if changed(kEmotionCurr) == 1 && kEmotionCurr != kEmotionPrev then
        kLFOFreqUpdated chnget "lfoFrequencyUpdated"
        kLFODepthUpdated chnget "lfoDepthUpdated"
        chnset kLFOFreqUpdated, "lfoFrequency"
        chnset kLFODepthUpdated, "lfoDepth"
    endif
    kEmotionPrev = kEmotionCurr
endin

instr UpdateDisplay
  
kDisplayType, kTrig cabbageGetValue "displayCombo"
    STypes[] init 4
    STypes[0] = "waveform"
    STypes[1] = "spectroscope"
    STypes[2] = "spectrogram"
    STypes[3] = "lissajous"
    
endin

instr MIDI_Listener

    ; Check for MIDI note events
    kStatus, kChan, kData1, kData2 midiin

    if (kStatus == 144) then
        iDur = 0.5 
        event "i", "FormantSynth", 0, iDur, kData1, kData2
    endif
    
endin

instr FormantSynth

    ; Capture the MIDI note
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
    
    kToggleEnv chnget "toggleEnvelope" 

    ; Depending on toggleEnvelope, either apply the envelope to the frequency or bypass it
    kMidiFreq = (kToggleEnv == 1 ? kMidiFreq * kFilterEnv : kMidiFreq)
    
    ; Generate MIDI signal
    aMidiSig vco2 kVel, kMidiFreq
    
    ; Process MIDI signal
    a1 reson aMidiSig, kFreq1, kBW1
    a2 reson aMidiSig, kFreq2, kBW2
    a3 reson aMidiSig, kFreq3, kBW3

    a1 *= 1/peak(a1)  ; normalize the amplitude of a1 to 1
    a2 *= 1/peak(a2)  ; normalize the amplitude of a2 to 1
    a3 *= 1/peak(a3)  ; normalize the amplitude of a3 to 1

    aMix = (a1 + a2 + a3) * kVol / 3 * kEnv  ; scale down formants 
    aMixL, aMixR pan2 aMix, 0.5  ; pan center
    
    display aMix, .1, 1
    dispfft aMix, .1, 1024
    
    outs aMixL, aMixR
    
endin

instr LoopSound
    aEnv madsr 1, 1, 1, 1

    ; === Tuning Control ===
    kTune chnget "tune"
    kFineTune chnget "fineTune"
    kTune = lag(kTune, 1)

    ; === Emotion and LFO Control ===
    kEmotion chnget "emotion" ; Retrieve Emotion control value
    
    ; Add tempered randomness to LFO based on Emotion
    kRandFreqRate = 0.05 + (kEmotion) 
    kRandDepthRate = 0.05 + (kEmotion)

    kRandFreq randi 0.1 * kEmotion, kRandFreqRate
    kRandDepth randi 0.1 * kEmotion, kRandDepthRate 
    
    kRandFreq = limit(kRandFreq, 0, 10) 
    kRandDepth = limit(kRandDepth, 0, 0.5)

    ; Get original LFO values
    kOrigLFOFreq chnget "lfoFrequency"
    kOrigLFODepth chnget "lfoDepth"
    
    ; Add randomness 
    kLFOFreq = kOrigLFOFreq + kRandFreq
    kLFODepth = kOrigLFODepth + kRandDepth

    kLFOWaveform chnget "lfoWaveform"

    chnset kLFOFreq, "lfoFrequency"
    chnset kLFODepth, "lfoDepth"
    
    ; Generate selected LFO waveform 
    if kLFOWaveform == 0 then
        kLFO oscili kLFODepth, kLFOFreq
    elseif kLFOWaveform == 1 then
        kLFO oscili kLFODepth, kLFOFreq, 10
    elseif kLFOWaveform == 2 then
        kLFOSignal phasor kLFOFreq
        kLFO = (kLFOSignal > 0.5) ? kLFODepth : -kLFODepth
    elseif kLFOWaveform == 3 then
        kLFOSignal phasor kLFOFreq
        kLFO = (kLFOSignal * 2 - 1) * kLFODepth
    endif

    ; === Signal Generation ===
    kTuneFreq = 220 * pow(2, (kTune + kLFO)/12 + kFineTune/100)
    aLoopSig vco2 0.01, kTuneFreq
    aLoopSig *= aEnv
    aLoopSig = butterhp(aLoopSig, 100)

    ; === Filter Settings ===
    kFreq1 chnget "kFreq1"
    kFreq2 chnget "kFreq2"
    kFreq3 chnget "kFreq3"
    kBW1 chnget "kBW1"
    kBW2 chnget "kBW2"
    kBW3 chnget "kBW3"
    kFreq1 = kFreq1 * pow(2, kTune/12)
    kFreq2 = kFreq2 * pow(2, kTune/12)
    kFreq3 = kFreq3 * pow(2, kTune/12)
    kBW1 = kBW1 * pow(2, kTune/12)
    kBW2 = kBW2 * pow(2, kTune/12)
    kBW3 = kBW3 * pow(2, kTune/12)

    ; Resonant filters
    a1 resonz aLoopSig, kFreq1, kBW1
    a2 resonz aLoopSig, kFreq2, kBW2
    a3 resonz aLoopSig, kFreq3, kBW3

    ; === Noise Generation ===
    kNoiseAmount chnget "noiseAmountSlider"
    aPink pinker
    aWhite rand 1
    aBreathNoise = aPink * 0.01 + aWhite * 0.01
    aBreathNoise *= kNoiseAmount * aEnv * (1 + 0.2 * kLFO)
    aBreathNoise = butterhp(aBreathNoise, 700)

    ; Process Breath Noise with formant filters
    aBreath1 reson aBreathNoise, kFreq1, kBW1
    aBreath2 reson aBreathNoise, kFreq2, kBW2
    aBreath3 reson aBreathNoise, kFreq3, kBW3

    ; Normalize each breath formant filter
    kNormBreath1 = 0.33
    kNormBreath2 = 0.33
    kNormBreath3 = 0.33

    aBreath = (aBreath1 * kNormBreath1 + aBreath2 * kNormBreath2 + aBreath3 * kNormBreath3)

    ; === Summing the Signals ===
    aMix = a1 + a2 + a3 + aBreath
    aMix = aMix * 0.25
    outs aMix, aMix
endin


instr Chorus

    ; Parameters declaration with default values
    idepth  init 10     
    irate   init 1       
    iwave   init 1        
    iphase  init 0        
    ideloff init 30        
    imix    init 1     
    kamp    init 0.7      

    aInL chnget "ChorusInL"
    aInR chnget "ChorusInR"

    aLfo1 oscil idepth, irate, iwave, iphase
    aLfo2 oscil idepth, irate, iwave, iphase + 0.25 ; quarter cycle out of phase

    aTempL delayr idepth + ideloff
    aChorusL deltapi aLfo1 + ideloff
    delayw aInL

    aTempR delayr idepth + ideloff
    aChorusR deltapi aLfo2 + ideloff
    delayw aInR

    aOutL = (aInL + aChorusL * imix) * 0.5 * kamp
    aOutR = (aInR + aChorusR * imix) * 0.5 * kamp

    outs aOutL, aOutR

endin

instr XYPad

    kx chnget "xCoordinate"
    ky chnget "yCoordinate"
    
    kTune chnget "tune"
    kFineTune chnget "fineTune"
    kNormTune = (kTune + 24) / 48

    ; Define formant values for MidRange vowels
    iF1_i_Mid = 270
    iF2_i_Mid = 2300
    iF3_i_Mid = 3000

    iF1_u_Mid = 300
    iF2_u_Mid = 870
    iF3_u_Mid = 2240

    iF1_e_Mid = 390
    iF2_e_Mid = 2000
    iF3_e_Mid = 2800

    iF1_o_Mid = 460
    iF2_o_Mid = 920
    iF3_o_Mid = 2420

    iF1_a_Mid = 730
    iF2_a_Mid = 1090
    iF3_a_Mid = 2440

    ; Calculate the mean frequency for all vowels to derive the central, or "Mid", formant frequencies
    iF1_Mid = (iF1_i_Mid + iF1_u_Mid + iF1_e_Mid + iF1_o_Mid + iF1_a_Mid) / 5
    iF2_Mid = (iF2_i_Mid + iF2_u_Mid + iF2_e_Mid + iF2_o_Mid + iF2_a_Mid) / 5
    iF3_Mid = (iF3_i_Mid + iF3_u_Mid + iF3_e_Mid + iF3_o_Mid + iF3_a_Mid) / 5

    ; Adjust formants based on normalized tuning. This interpolates between the Mid value and the specific vowel formant
    kF1_i = iF1_i_Mid + (iF1_Mid - iF1_i_Mid) * kNormTune
    kF2_i = iF2_i_Mid + (iF2_Mid - iF2_i_Mid) * kNormTune
    kF3_i = iF3_i_Mid + (iF3_Mid - iF3_i_Mid) * kNormTune

    kF1_u = iF1_u_Mid + (iF1_Mid - iF1_u_Mid) * kNormTune
    kF2_u = iF2_u_Mid + (iF2_Mid - iF2_u_Mid) * kNormTune
    kF3_u = iF3_u_Mid + (iF3_Mid - iF3_u_Mid) * kNormTune

    kF1_e = iF1_e_Mid + (iF1_Mid - iF1_e_Mid) * kNormTune
    kF2_e = iF2_e_Mid + (iF2_Mid - iF2_e_Mid) * kNormTune
    kF3_e = iF3_e_Mid + (iF3_Mid - iF3_e_Mid) * kNormTune

    kF1_o = iF1_o_Mid + (iF1_Mid - iF1_o_Mid) * kNormTune
    kF2_o = iF2_o_Mid + (iF2_Mid - iF2_o_Mid) * kNormTune
    kF3_o = iF3_o_Mid + (iF3_Mid - iF3_o_Mid) * kNormTune

    ; 2D Interpolation: Interpolate formants based on ky (Y coordinate) between 'i' and 'u' and between 'e' and 'o'
    kF1_i_u = kF1_i + (kF1_u - kF1_i) * ky
    kF2_i_u = kF2_i + (kF2_u - kF2_i) * ky
    kF3_i_u = kF3_i + (kF3_u - kF3_i) * ky

    kF1_e_o = kF1_e + (kF1_o - kF1_e) * ky
    kF2_e_o = kF2_e + (kF2_o - kF2_e) * ky
    kF3_e_o = kF3_e + (kF3_o - kF3_e) * ky

    ; Interpolate between the two previously interpolated sets based on kx (X coordinate)
    kF1 = kF1_i_u + (kF1_e_o - kF1_i_u) * kx + (iF1_a_Mid - kF1_i_u) * (1-abs(2*kx-1)) * (1-abs(2*ky-1))
    kF2 = kF2_i_u + (kF2_e_o - kF2_i_u) * kx + (iF2_a_Mid - kF2_i_u) * (1-abs(2*kx-1)) * (1-abs(2*ky-1))
    kF3 = kF3_i_u + (kF3_e_o - kF3_i_u) * kx + (iF3_a_Mid - kF3_i_u) * (1-abs(2*kx-1)) * (1-abs(2*ky-1))

    kF1 = kF1 * pow(2, kTune/12 + kFineTune/100)
    kF2 = kF2 * pow(2, kTune/12 + kFineTune/100)
    kF3 = kF3 * pow(2, kTune/12 + kFineTune/100)

    chnset kF1, "kFreq1"
    chnset kF2, "kFreq2"
    chnset kF3, "kFreq3"

    ; Get the status of the automation toggle and speed
    kActivate chnget "autoVowel"
    kAutoSpeed chnget "autoSpeed"

    if kActivate == 1 then
        ; Circular motion for X and Y coordinates 
        kTheta phasor kAutoSpeed ; use the autoSpeed value as the phasor's rate
        kx = 0.5 + 0.5*cos(kTheta*2*$M_PI)
        ky = 0.5 + 0.5*sin(kTheta*2*$M_PI)

        ; Update X and Y coordinate channels with newly computed values
        chnset kx, "xCoordinate"
        chnset ky, "yCoordinate"
    else
        ; If not in automation mode, simply retrieve the manually set X and Y coordinates
        kx chnget "xCoordinate"
        ky chnget "yCoordinate"
    endif
endin


</CsInstruments>
<CsScore>
f0 z
f 10 0 4096 10 1
f 1 0 4096 10 1
i"UpdateGUI" 0 z
i"Chorus" 0 z 0.8 
i"MIDI_Listener" 0 z
i"UpdateDisplay" 0 z
i"XYPad" 0 z
</CsScore>

</CsoundSynthesizer>