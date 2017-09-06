//
//  ViewController.swift
//  pedometer
//
//  Created by Morikawa Gento on 2017/09/06.
//  Copyright © 2017年 gentom. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!
    // init
    let pedometer = CMPedometer()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(CMPedometer.isStepCountingAvailable()){
            
            self.pedometer.startUpdates(from: NSDate() as Date) {
                (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        // step num
                        let steps = data!.numberOfSteps
                        let distance = data?.distance?.doubleValue
                        self.counter.text = "steps: \(steps)" + "\n\ndistance: \(distance)"
                    }
                })
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

