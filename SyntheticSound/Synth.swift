//
//  Synth.swift
//  SyntheticSound
//
//  Created by Brian Marx on 12/18/16.
//  Copyright © 2016 Brian Marx. All rights reserved.
//

import AudioKit

class Synth {
    
    var mainOscFreq = 1000.0
    var mainFilterFreq = 1000.0
    
    var mainOsc = AKOscillator(waveform: AKTable(.sawtooth))
    var lp = AKLowPassFilter(AKOscillator(), cutoffFrequency: 1000.0)
    var bp = AKBandPassFilter(AKOscillator(), centerFrequency: 1000.0)
    var hp = AKHighPassFilter(AKOscillator(), cutoffFrequency: 1000.0)
    var none = AKLowPassFilter(AKOscillator(), cutoffFrequency: 20000.0)

    var mixer = AKMixer()
    

    
    init() {
        lp = AKLowPassFilter(mainOsc, cutoffFrequency: mainFilterFreq)
        lp.start()
        bp = AKBandPassFilter(mainOsc, centerFrequency: mainFilterFreq)
        bp.start()
        hp = AKHighPassFilter(mainOsc, cutoffFrequency: mainFilterFreq)
        hp.start()
        none = AKLowPassFilter(mainOsc, cutoffFrequency: 20000.0)
        none.start()
        
        mixer = AKMixer(lp, bp, hp, none)
        mixer.volume = 1.0
        mixer.start()
    }
    
    func setOsc(osc: String) {
        mainOsc.stop()
        print(osc)
        switch osc {
            case "saw":
                mainOsc = AKOscillator(waveform: AKTable(.sawtooth))
            case "square":
                mainOsc = AKOscillator(waveform: AKTable(.square))
            case "sine":
                mainOsc = AKOscillator(waveform: AKTable(.sine))
            case "triangle":
                mainOsc = AKOscillator(waveform: AKTable(.triangle))
            default:
                break;
        }
        mainOsc.start()
    }//end setOsc
    
    func setFilter(filter: String) {
        print(filter)
        switch filter {
            case "lp": lp = AKLowPassFilter(mainOsc, cutoffFrequency: mainFilterFreq)
                lp.dryWetMix = 100
                bp.dryWetMix = 0
                hp.dryWetMix = 0
                none.dryWetMix = 0
            case "bp": bp = AKBandPassFilter(mainOsc, centerFrequency: mainFilterFreq)
                bp.dryWetMix = 100
                lp.dryWetMix = 0
                hp.dryWetMix = 0
                none.dryWetMix = 0
            case "hp": hp = AKHighPassFilter(mainOsc, cutoffFrequency: mainFilterFreq)
                hp.dryWetMix = 100
                bp.dryWetMix = 0
                lp.dryWetMix = 0
                none.dryWetMix = 0
            case "none": none = AKLowPassFilter(mainOsc, cutoffFrequency: 20000.0)
                bp.dryWetMix = 0
                hp.dryWetMix = 0
                lp.dryWetMix = 0
                none.dryWetMix = 100
            default: break
        }
    }//end setFilter
    
    func setFilterFreq(freq: Double) {
        mainFilterFreq = freq
    }
    
    func setOscFreq(freq: Double) {
        mainOscFreq = freq
    }

    func startYourEngine() {
        AudioKit.output = mixer
        AudioKit.start()
    }
    
}
