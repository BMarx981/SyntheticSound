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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Play Stop button controls synth activation
    @IBAction func PlayStop(_ sender: UIButton) {
    }
    
    //OscSelector chooses which oscillator is used
    @IBAction func OscSelector(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: setOsc(osc: "saw")
            case 1: setOsc(osc: "square")
            case 2: setOsc(osc: "sine")
            case 3: setOsc(osc: "triangle")
            default: break
        }
    }
    
    //Oscillator frequency slider
    @IBAction func OscFreqSlider(_ sender: UISlider) {
        setOscFreq(10e(Double(sender.value))
    }
    
    //Filter Selector Control chooses which filter is used
    @IBAction func FilterSelector(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: setFilter(filter: "lp")
            case 1: setFilter(filter: "bp")
            case 2: setFilter(filter: "hp")
            case 3: setFilter(filter: "none")
        }
    }

    //Filter Frequency Slider
    @IBAction func FilterFreqSlider(_ sender: UISlider) {
        setFilterFreq(10e(Double(sender.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

