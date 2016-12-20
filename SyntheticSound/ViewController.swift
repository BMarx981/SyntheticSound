//
//  ViewController.swift
//  SyntheticSound
//
//  Created by Brian Marx on 12/18/16.
//  Copyright © 2016 Brian Marx. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    let synth = Synth()
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioKit.output = synth.mixer
        AudioKit.start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Play Stop button controls synth activation
    @IBAction func PlayStop(_ sender: UIButton) {
        if mainOsc.isPlaying {
            sender.setTitle("Play", for: .normal)
            sender.setTitleColor(UIColor.blue, for: .normal)
            mainOsc.stop()
            synth.mixer.stop()
        } else {
            sender.setTitle("Stop", for: .normal)
            sender.setTitleColor(UIColor.red, for: .normal)
            mainOsc.start()
            synth.mixer.start()
        }
    }
    
    //OscSelector chooses which oscillator is used
    @IBAction func OscSelector(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: synth.setOsc(osc: "saw"); print(sender.selectedSegmentIndex)
        case 1: synth.setOsc(osc: "square"); print(sender.selectedSegmentIndex)
        case 2: synth.setOsc(osc: "sine"); print(sender.selectedSegmentIndex)
        case 3: synth.setOsc(osc: "triangle"); print(sender.selectedSegmentIndex)
            default: break
        }
    }
    
    //Oscillator frequency slider
    @IBAction func OscFreqSlider(_ sender: UISlider) {
        synth.setOscFreq(freq: pow(10, Double(sender.value)))
    }
    
    //Filter Selector Control chooses which filter is used
    @IBAction func FilterSelector(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: synth.setFilter(filter: "lp")
            case 1: synth.setFilter(filter: "bp")
            case 2: synth.setFilter(filter: "hp")
            case 3: synth.setFilter(filter: "none")
            default: break;
        }
    }

    //Filter Frequency Slider
    @IBAction func FilterFreqSlider(_ sender: UISlider) {
        synth.setFilterFreq(freq: pow(10, Double(sender.value)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

