//
//  ViewController.swift
//  Stop Watch
//
//  Created by D7703_25 on 2018. 4. 12..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        
    }
    @IBAction func btStart(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()
            
        })
    }
    
    @IBAction func btStop(_ sender: Any) {
        myTimer.invalidate()
    }
    
    @IBAction func btReset(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
    }
    
    
}
