<Cabbage>
form caption("Formant Synth"), size(630, 550), colour(129, 129, 129), pluginId("talk")

plant("LoopMode") {
    label bounds(60, 10, 520, 20), text("Formant Synthesizer"), fontColour(255, 255, 255, 255), font("default", 16)
}

button bounds(60, 35, 130, 25), channel("toggleInstrument"), identChannel("instrIdent"), text("Loop: OFF"), latched(1)
button bounds(192, 35, 130, 25), channel("toggleEnvelope"), identChannel("envIdent"), text("Envelope: OFF"), latched(1)

plant("Formants") {
    groupbox bounds(60, 65, 520, 90), text("Formants"), colour(200, 200, 200)
    hslider bounds(65, 85, 510, 20), channel("kFreq1"), range(0.001, 1000, 300, 1, 0.001), text("Formant 1 Frequency") trackerColour(0, 67, 210, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 110, 510, 20), channel("kFreq2"), range(0.001, 1000, 870, 1, 0.001), text("Formant 2 Frequency") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 135, 510, 20), channel("kFreq3"), range(0.001, 2500, 2250, 1, 0.001), text("Formant 3 Frequency") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
}

plant("Bandwidth") {
    groupbox bounds(60, 160, 520, 90), text("Bandwidth"), colour(200, 200, 200)
    hslider bounds(65, 180, 510, 20), channel("kBW1"), range(0.001, 500, 60, 1, 0.001), text("Bandwidth 1") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 205, 510, 20), channel("kBW2"), range(0.001, 500, 90, 1, 0.001), text("Bandwidth 2") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 230, 510, 20), channel("kBW3"), range(0.001, 500, 200, 1, 0.001), text("Bandwidth 3") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
}

plant("ADSR") {
    groupbox bounds(60, 255, 520, 115), text("ADSR"), colour(200, 200, 200)
    hslider bounds(65, 275, 510, 20), channel("att"), range(0.001, 1, 0.01, 10, 0.01), text("Attack") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 300, 510, 20), channel("dec"), range(0.001, 1, 0.5, 1, 0.01), text("Decay") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 325, 510, 20), channel("sus"), range(0.001, 1, 0.5, 1, 0.01), text("Sustain") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
    hslider bounds(65, 350, 510, 20), channel("rel"), range(0.001, 1, 0.7, 10, 0.01), text("Release") trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)
}

plant("KeyboardMode") {
    keyboard bounds(60, 375, 520, 80))
}

vslider bounds(-45, 50, 150, 470), channel("masterVolume"), range(0, 1, 0.5, 1, 0.01), trackerColour(0, 0, 255, 255) textColour(255, 255, 255, 255)

button bounds(330, 460, 260, 25), channel("savePreset"), text("Save as New Preset")

combobox bounds(60, 490, 260, 25), channel("presetCombo"), items("Default")
button bounds(330, 490, 260, 25), channel("deletePreset"), text("Delete Selected Preset")

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -d -m0d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 2
0dbfs = 1
sr = 44100

instr UpdateGUI
    kToggleInstrument chnget "toggleInstrument"
    kTrigInstrument changed kToggleInstrument 

    if kTrigInstrument == 1 then
        if kToggleInstrument == 1 then
            chnset "text(\"Loop: ON\")", "instrIdent"
            event "i", "LoopSound", 0, -1 ; Start the LoopSound
        else
            chnset "text(\"Loop: OFF\")", "instrIdent"
            turnoff2 "LoopSound", 0, 0.01 ; Stop the LoopSound with a short fade-out time
        endif
    endif

    kToggleEnvelope chnget "toggleEnvelope"
    kTrigEnvelope changed kToggleEnvelope

    if kTrigEnvelope == 1 then
        if kToggleEnvelope == 1 then
            chnset "text(\"Envelope: ON\")", "envIdent"
        else
            chnset "text(\"Envelope: OFF\")", "envIdent"
        endif
    endif
endin



instr LoopSound
    aEnv madsr chnget("att"), chnget("dec"), chnget("sus"), chnget("rel")

    aLoopSig vco2 1, 440 
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

    aMix = (a1 + a2 + a3) * kVol / 2  ; scale down the combined formants 
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

    kEnv madsr chnget("att"), chnget("dec"), chnget("sus"), chnget("rel")
    kFreq1 chnget "kFreq1"
    kFreq2 chnget "kFreq2"
    kFreq3 chnget "kFreq3"
    kBW1 chnget "kBW1"
    kBW2 chnget "kBW2"
    kBW3 chnget "kBW3"
    kVol chnget "masterVolume"
    
    kToggleEnv chnget "toggleEnvelope" ; get the state of the toggleEnvelope button

    ; Depending on toggleEnvelope, either apply the envelope to the frequency or bypass it
    kMidiFreq = (kToggleEnv == 1 ? kMidiFreq * kEnv : kMidiFreq)
    
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
    
    outs aMixL, aMixR
endin


</CsInstruments>
<CsScore>
f0 z
i"UpdateGUI" 0 z
i"MIDI_Listener" 0 z
</CsScore>

</CsoundSynthesizer>