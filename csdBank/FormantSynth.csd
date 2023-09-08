<Cabbage>
form caption("FormantSynth"), size(765, 650), colour(129, 129, 129), pluginId("talk")

label bounds(10, 10, 200, 20), text("Formant Synthesizer"), fontColour(255, 255, 255, 255), font("default", 16)

; Master volume and main controls
;groupbox bounds(5, 85, 80, 400), text("Master"), colour(200, 200, 200)
vslider bounds(20, 105, 50, 375), channel("kMasterVolume"), range(0, 1, 0.5), text("Vol.") trackerColour(0, 0, 255, 255)

button bounds(90, 80, 90, 50), channel("toggleInstrument"), identChannel("toggleInstrumentID"), text("Loop: OFF"), latched(1) 
rslider bounds(180, 70, 60, 60), channel("tune"), range(-24, 24, 0), text("Tune"), trackerColour(0, 0, 255, 255)
rslider bounds(240, 70, 60, 60), channel("fineTune"), range(-1, 1, 0), text("Fine-Tune"), trackerColour(0, 0, 255, 255)  
rslider bounds(300, 70, 60, 60), channel("lfoFrequency"), range(0.1, 10, 1), text("LFO Frequency"), trackerColour(0, 0, 255, 255)
rslider bounds(360, 70, 60, 60), channel("lfoDepth"), range(0, 1, 0.5), text("LFO Depth"), trackerColour(0, 0, 255, 255)
rslider bounds(420, 70, 60, 60), channel("lfoWaveform"), range(0, 1, 0.5), text("LFO Waveform"), trackerColour(0, 0, 255, 255)
hslider bounds(90, 40, 450, 30), channel("waveformShapeSlider"), range(0, 1, 0.5), text("Waveform Shape"), trackerColour(0, 0, 255, 255)
rslider bounds(540, 30, 60, 60), channel("waveformSkew"), range(0, 1, 0.5), text("Waveform Skew"), trackerColour(0, 0, 255, 255)

; XYPad and control sliders
;groupbox bounds(315, 160, 220, 210), text("XYPad"), colour(200, 200, 200)
xypad bounds(325, 190, 200, 160), channel("xCoordinate", "yCoordinate") ; +10
hslider bounds(325, 355, 200, 20), channel("xCoord"), range(0, 1, 0.5, 1) ; +10
vslider bounds(530, 190, 20, 160), channel("yCoord"), range(0, 1, 0.5, 1) ; +10


button bounds(325, 140, 80, 25), channel("autoVowel"), identChannel("autoVowelID"), text("AutoVowel")
button bounds(415, 140, 80, 25), channel("splatter"), identChannel("splatterID"), text("Splatter")
button bounds(415, 170, 80, 15), channel("hardSplat"), identChannel("hardSplatID"), text("HardSplat")

rslider bounds(495, 140, 54, 54) range(0, 1, 0.5) channel("splatSpeed") text("SplatSpeed")


hslider bounds(325, 370, 210, 25), channel("autoSpeed"), range(-1, 1, 0), text("AutoSpeed") trackerColour(0, 0, 255, 255)
hslider bounds(325, 395, 210, 25), channel("autoRadius"), range(-1, 1, 0), text("AutoRadius") trackerColour(0, 0, 255, 255)
hslider bounds(325, 420, 210, 25), channel("autoRandom"), range(-1, 1, 0), text("AutoRandom") trackerColour(0, 0, 255, 255)
hslider bounds(325, 445, 210, 25), channel("autoRandomRadius"), range(-1, 1, 0), text("AutoRandomRadius") trackerColour(0, 0, 255, 255)

plant("Bandwidth") {
    ; Adjusted the y-position values of BW sliders to push them down
    hslider bounds(325, 480, 210, 25), channel("kBW1"), range(0.001, 500, 60), text("BW1") trackerColour(0, 0, 255, 255)
    hslider bounds(325, 510, 210, 25), channel("kBW2"), range(0.001, 500, 90), text("BW2") trackerColour(0, 0, 255, 255)
    hslider bounds(325, 540, 210, 25), channel("kBW3"), range(0.001, 500, 200), text("BW3") trackerColour(0, 0, 255, 255)
}


; Other group controls
plant("NoiseAmount") {
    ; groupbox bounds(540, 80, 220, 120), text("Noise and Tone Amount"), colour(200, 200, 200)
    hslider bounds(550, 100, 200, 20), channel("noiseAmountSlider"), range(0, 1, 0.5), text("Breathiness") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 130, 200, 20), channel("toneVolumeSlider"), range(0, 1, 0.5), text("Tone") trackerColour(0, 0, 255, 255)
}


plant("Formants") {
    ;groupbox bounds(90, 365, 220, 190), text("Formants"), colour(200, 200, 200)
    vslider bounds(126, 390, 25, 150), channel("kFreq1"), range(0.1, 4000, 300, 1, 0.1), text("F1") trackerColour(0, 67, 210, 255) textColour(255, 255, 255, 255)
    vslider bounds(187, 390, 25, 150), channel("kFreq2"), range(0.1, 4000, 870, 1, 0.1), text("F2") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    vslider bounds(248, 390, 25, 150), channel("kFreq3"), range(0.1, 4000, 2250, 1, 0.1), text("F3") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
}

plant("AMPADSR") {
    ;groupbox bounds(540, 145, 220, 210), text("AMP ENVELOPE"), colour(200, 200, 200)
    hslider bounds(550, 165, 200, 25), channel("ampAttack"), range(0.3, 1, 0.01), text("Attack") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 195, 200, 25), channel("ampDecay"), range(0.3, 1, 0.01), text("Decay") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 225, 200, 25), channel("ampSustain"), range(0, 1, 0.5), text("Sustain") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 255, 200, 25), channel("ampRelease"), range(0.1, 10, 0.5), text("Release") trackerColour(0, 0, 255, 255)
}

button bounds(540, 345, 150, 25), channel("toggleEnvelope"), text("Envelope: OFF"), latched(1)

plant("FILTERADSR") {
    groupbox bounds(540, 375, 220, 210), text("FILTER ENVELOPE"), colour(200, 200, 200)

    hslider bounds(550, 395, 200, 25), channel("filterAttack"), range(0.001, 1, 0.01), text("Attack") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 425, 200, 25), channel("filterDecay"), range(0.001, 1, 0.01), text("Decay") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 455, 200, 25), channel("filterSustain"), range(0.001, 1, 0.5), text("Sustain") trackerColour(0, 0, 255, 255)
    hslider bounds(550, 485, 200, 25), channel("filterRelease"), range(0.001, 10, 0.5), text("Release") trackerColour(0, 0, 255, 255)
}

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -odac --displays -d -m0d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 2
0dbfs = 1

instr UpdateGUI

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
    
    ; Handling toggleInstrument

    kToggleInstrument chnget "toggleInstrument"
    kTrigInstrument changed kToggleInstrument 

    if kTrigInstrument == 1 then
        if kToggleInstrument == 1 then
            chnset "text(\"Drone: ON\")", "toggleInstrumentID"
            event "i", "LoopSound", 0, -1 ; Start the LoopSound
            event "i", "XYPad", 0, -1 ; Start the XYPad
        elseif kToggleInstrument == 0 then
            chnset "text(\"Drone: OFF\")", "toggleInstrumentID"
            turnoff2 "LoopSound", 0, 0.01 ; Stop the LoopSound with a short fade-out time
            turnoff2 "XYPad", 0, 0.01 ; Stop the XYPad with a short fade-out time
        endif
    endif
    
    ; Define string arrays for button channels and their corresponding identChannels
    iNumButtons = 4 ; Updated to reflect two additional buttons
    SChannels[] init iNumButtons
    SIdentChannels[] init iNumButtons
    gkPrevButtonStates[] init iNumButtons
    kButtonStates[] init iNumButtons

    ; Fill the arrays with the channel names
    SChannels[0] = "autoVowel"
    SChannels[1] = "splatter"
    SChannels[2] = "toggleInstrument" ; New button
    SChannels[3] = "toggleEnvelope"   ; New button
    
    SIdentChannels[0] = "autoVowelID"
    SIdentChannels[1] = "splatterID"
    SIdentChannels[2] = "toggleInstrumentID" ; New button identChannel
    SIdentChannels[3] = "toggleEnvelopeID"   ; New button identChannel

    kIndex = 0
    until kIndex == iNumButtons do
        ; Fetch the current state of the button
        kButtonStates[kIndex] chnget SChannels[kIndex]

        ; If state has changed
        if kButtonStates[kIndex] != gkPrevButtonStates[kIndex] then
            if kButtonStates[kIndex] == 1 then
                ; Button is ON, set to green
                chnset "colour:1(0,255,0) colour:0(0,255,0)", SIdentChannels[kIndex]
            else
                ; Button is OFF, set to black
                chnset "colour:1(0,0,0) colour:0(0,0,0)", SIdentChannels[kIndex]
            endif
            ; Update the previous state array
            gkPrevButtonStates[kIndex] = kButtonStates[kIndex]
        endif
        kIndex += 1
    od
    

endin

instr LoopSound
    
    ; Amp Envelope Logic
    iAmpAttack chnget "ampAttack"
    iAmpDecay chnget "ampDecay"
    iAmpSustain chnget "ampSustain"
    iAmpRelease chnget "ampRelease"

    aEnv madsr iAmpAttack, iAmpDecay, iAmpSustain, iAmpRelease ; Amp Envelope
    
    ; Freq Envelope Logic
    iFilterAttack chnget "filterAttack"
    iFilterDecay chnget "filterDecay"
    iFilterSustain chnget "filterSustain"
    iFilterRelease chnget "filterRelease"
    aFilterEnv madsr iFilterAttack, iFilterDecay, iFilterSustain, iFilterRelease ; Filter Envelope

    ; === Tuning Control ===
    kTune chnget "tune"
    kFineTune chnget "fineTune"
    kTune = lag(kTune, 1)
    kOrigLFOFreq chnget "lfoFrequency"
    kOrigLFODepth chnget "lfoDepth"
    
    ; Add randomness 
    kLFOFreq = kOrigLFOFreq 
    kLFODepth = kOrigLFODepth 

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
    kMasterVolume chnget "kMasterVolume"
    
    kWaveformShape chnget "waveformShapeSlider"
    kWaveformSkew chnget "waveformSkew"
    
    kTuneFreq = 220 * pow(2, (kTune + kLFO)/12 + kFineTune/100)
    asigTuneFreq = a(kTuneFreq)
    aWaveformShape = a(kWaveformShape)
    aWaveformSkew = a(kWaveformSkew)
    
    aSquin squinewave asigTuneFreq, aWaveformShape, aWaveformSkew, 0, 80

    aLoopSig = aSquin * aEnv
    aLoopSig = butterhp(aLoopSig, 200)


    ; === Filter Settings ===
    ; Get the base formant frequencies
    kFreq1 chnget "kFreq1"
    kFreq2 chnget "kFreq2"
    kFreq3 chnget "kFreq3"

    ; Define modulation depths for each formant (here I'm using 50% as an example for all, but you can customize this)
    kModDepth1 = 0.5  ; 50% modulation depth for Freq1
    kModDepth2 = 0.5  ; 50% modulation depth for Freq2
    kModDepth3 = 0.5  ; 50% modulation depth for Freq3

    ; Calculate the frequency modulation due to the envelope for each formant
    kFreqShift1 = kFreq1 * kModDepth1 * aFilterEnv
    kFreqShift2 = kFreq2 * kModDepth2 * aFilterEnv
    kFreqShift3 = kFreq3 * kModDepth3 * aFilterEnv

    ; Get the modulated formant frequencies
    kFreq1Modulated = kFreq1 + kFreqShift1
    kFreq2Modulated = kFreq2 + kFreqShift2
    kFreq3Modulated = kFreq3 + kFreqShift3
    
    kBW1 chnget "kBW1"
    kBW2 chnget "kBW2"
    kBW3 chnget "kBW3"
    kFreq1 = kFreq1Modulated * pow(2, kTune/12)
    kFreq2 = kFreq2Modulated * pow(2, kTune/12)
    kFreq3 = kFreq3Modulated * pow(2, kTune/12)
    
    kBW1 = kBW1 * pow(2, kTune/12)
    kBW2 = kBW2 * pow(2, kTune/12)
    kBW3 = kBW3 * pow(2, kTune/12)
    
    kFormantLFOScale = 0.05  ; You can adjust this value based on your needs
    
    ; Apply scaled LFO to formant frequencies and bandwidths
    kFreq1 += kFreq1 * kLFO * kFormantLFOScale
    kFreq2 += kFreq2 * kLFO * kFormantLFOScale
    kFreq3 += kFreq3 * kLFO * kFormantLFOScale
    kBW1 += kBW1 * kLFO * kFormantLFOScale
    kBW2 += kBW2 * kLFO * kFormantLFOScale
    kBW3 += kBW3 * kLFO * kFormantLFOScale
    
    kFreq1 = limit(kFreq1, 20, 20000)
    kFreq2 = limit(kFreq2, 20, 20000)
    kFreq3 = limit(kFreq3, 20, 20000)
    kBW1 = limit(kBW1, 0.1, 10)
    kBW2 = limit(kBW2, 0.1, 10)
    kBW3 = limit(kBW3, 0.1, 10)

    ; Resonant filters
    a1 resonz aLoopSig, kFreq1Modulated, kBW1 ; Use the modulated frequency
    a2 resonz aLoopSig, kFreq2, kBW2
    a3 resonz aLoopSig, kFreq3, kBW3
    
      ; Reduced resonance by introducing a damping factor
    kDamping = 0
    kDamping = limit(kDamping, 0.1, 1)
    a1 *= kDamping
    a2 *= kDamping
    a3 *= kDamping

    ; === Noise Generation ===
    kNoiseAmount chnget "noiseAmountSlider"
    aPink pinker
    aWhite rand 1
    aBreathNoise = aPink * 0.01 + aWhite * 0.01
    aBreathNoise *= kNoiseAmount * aEnv * (1 + 0.2 * kLFO)
    aBreathNoise = butterhp(aBreathNoise, 300)

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
    kToneVolume chnget "toneVolumeSlider"


    aTone = kToneVolume * (a1 + a2 + a3)
    aMix = 0.5 * aTone + 0.5 * aBreath

    aMix = limit(aMix, -1, 1) ; Added a limiter to prevent clipping
    
    aMix *= kMasterVolume
    
    outs aMix, aMix

endin

instr XYPad

    ; Get x and y values from the sliders
    kxCoord chnget "xCoord"
    kyCoord chnget "yCoord"

    ; Get values from XYPad
    kx chnget "xCoordinate"
    ky chnget "yCoordinate"

    ; Check if sliders have moved
    if changed(kxCoord) == 1 then
        chnset kxCoord, "xCoordinate"
        kx = kxCoord
    endif

    if changed(kyCoord) == 1 then
        chnset kyCoord, "yCoordinate"
        ky = kyCoord
    endif

    ; Check if XYPad has moved
    if changed(kx) == 1 && changed(kxCoord) == 0 then
        chnset kx, "xCoord"
    endif

    if changed(ky) == 1 && changed(kyCoord) == 0 then
        chnset ky, "yCoord"
    endif

    ; Process vowel formants
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

    ; Calculate the mean frequency for all vowels
    iF1_Mid = (iF1_i_Mid + iF1_u_Mid + iF1_e_Mid + iF1_o_Mid + iF1_a_Mid) / 5
    iF2_Mid = (iF2_i_Mid + iF2_u_Mid + iF2_e_Mid + iF2_o_Mid + iF2_a_Mid) / 5
    iF3_Mid = (iF3_i_Mid + iF3_u_Mid + iF3_e_Mid + iF3_o_Mid + iF3_a_Mid) / 5

    ; Adjust formants based on normalized tuning
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

    ; 2D Interpolation for 'i' and 'u' and between 'e' and 'o'
    kF1_i_u = kF1_i + (kF1_u - kF1_i) * ky
    kF2_i_u = kF2_i + (kF2_u - kF2_i) * ky
    kF3_i_u = kF3_i + (kF3_u - kF3_i) * ky

    kF1_e_o = kF1_e + (kF1_o - kF1_e) * ky
    kF2_e_o = kF2_e + (kF2_o - kF2_e) * ky
    kF3_e_o = kF3_e + (kF3_o - kF3_e) * ky

    kF1 = kF1_i_u + (kF1_e_o - kF1_i_u) * kx
    kF2 = kF2_i_u + (kF2_e_o - kF2_i_u) * kx
    kF3 = kF3_i_u + (kF3_e_o - kF3_i_u) * kx

    ; Final frequency adjustments based on tuning
    kF1 = kF1 * pow(2, kTune/12 + kFineTune/100)
    kF2 = kF2 * pow(2, kTune/12 + kFineTune/100)
    kF3 = kF3 * pow(2, kTune/12 + kFineTune/100)

    chnset kF1, "kFreq1"
    chnset kF2, "kFreq2"
    chnset kF3, "kFreq3"
    
    ; Get status of variables
    kActivate chnget "autoVowel"
    kAutoSpeed chnget "autoSpeed"
    kAutoRadius chnget "autoRadius"
    kAutoRandom chnget "autoRandom"
    kAutoRandomRadius chnget "autoRandomRadius"
    gkPrevSplatter init 0  
    gkTargetX init 0       
    gkTargetY init 0     
    kSplatter chnget "splatter"
    kSplatSpeed chnget "splatSpeed"

    ; Get status of HardSplat
    kHardSplat chnget "hardSplat"

; Initialize a counter to keep track of the cycles
gkSplatCounter init 0

    ; Check if Splatter is enabled
    if kSplatter == 1 then
       ; When HardSplat is active, use the kSplatSpeed as a delay mechanism
    if kHardSplat == 1 then
        ; Increment the counter each cycle
        gkSplatCounter = gkSplatCounter + 1

        ; Adjusting the threshold with a scaling factor. In this case, I've multiplied by 5 to make it 5 times slower.
        ; You can adjust this value as per your needs to achieve the desired speed.
        if gkSplatCounter > (100 / kSplatSpeed) then
            gkTargetX random 0, 1
            gkTargetY random 0, 1
            kx = gkTargetX
            ky = gkTargetY
            gkSplatCounter = 0 ; Reset counter
        endif
    else
            ; Generate a random target point if we're just starting or we're close enough to the previous target
            if gkPrevSplatter == 0 || abs(kx - gkTargetX) < 0.05 && abs(ky - gkTargetY) < 0.05 then
                gkTargetX random 0, 1
                gkTargetY random 0, 1
            endif

            ; Lerp towards the target.
            kx = kx + (gkTargetX - kx) * kSplatSpeed / 20
            ky = ky + (gkTargetY - ky) * kSplatSpeed / 20
        endif

        ; Update the X and Y coordinate channels
        chnset kx, "xCoordinate"
        chnset ky, "yCoordinate"
    endif

    kPrevSplatter = kSplatter  ; Store the previous status of Splatter

    if kActivate == 1 then
        ; Circular motion for X and Y coordinates 
        kTheta phasor kAutoSpeed

        ; Using the absolute value of autoRadius to always get the magnitude
        kRadius = abs(kAutoRadius)
        kDirection = signum(kAutoRadius) ; Will be 1 for positive values and -1 for negative values

        kx = 0.5 + kRadius*cos(kTheta*2*$M_PI*kDirection) 
        ky = 0.5 + kRadius*sin(kTheta*2*$M_PI*kDirection)

        ; Introduce a shiver effect based on AutoRandomRadius
        kRandomX = kAutoRandom * kAutoRandomRadius * randh(1, -1, 10)
        kRandomY = kAutoRandom * kAutoRandomRadius * randh(1, -1, 10)

        kx = kx + kRandomX
        ky = ky + kRandomY

        ; Ensure kx and ky values remain within [0, 1]
        kx limit kx, 0, 1
        ky limit ky, 0, 1

        ; Update X and Y coordinate channels with newly computed values
        chnset kx, "xCoordinate"
        chnset ky, "yCoordinate"
    endif
    
endin

instr InitXYPad

    kx chnget "xCoord"
    ky chnget "yCoord"
    kxCoord chnget "xCoordinate"
    kyCoord chnget "yCoordinate"
    
    iXinit = 0.5
    iYinit = 0.5
    
    chnset iXinit, "xCoord"
    chnset iYinit, "yCoord"
    chnset iXinit, "xCoordinate"
    chnset iYinit, "yCoordinate"
    
endin

</CsInstruments>
<CsScore>
; Initializations
i "InitXYPad" 0 1
i "UpdateGUI" 0 z

; Waveforms
f 1 0 8192 10 1      ; Sine wave for sound generation
f 2 0 8192 10 1 0    ; Saw wave (modify if you have a better saw wave)
f 3 0 8192 7 1 0.5 0 ; Square wave
f 0 0 8192 -2 0      ; Empty table for morphing

; LFO and other signal tables
f 10 0 4096 10 1     ; Sine wave for LFO

</CsScore>




</CsoundSynthesizer>