//
//  ViewController.swift
//  WaxButton
//
//  Created by I Mac on 4/10/18.
//  Copyright © 2018 I Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var Button: WaxButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func slider(_ sender: Any) {
        Button.EndValue = CGFloat(slider.value)
        
    }
    
}

