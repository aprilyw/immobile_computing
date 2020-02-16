//
//  ViewController.swift
//  test4lmao
//
//  Created by Ausar Mundra on 2/15/20.
//  Copyright © 2020 Immobile Computing. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    
    @IBOutlet weak var xAcel: UILabel!
    @IBOutlet weak var yAcel: UILabel!
    @IBOutlet weak var zAcel: UILabel!
    @IBOutlet weak var xgyro: UILabel!
    @IBOutlet weak var ygyro: UILabel!
    @IBOutlet weak var zgyro: UILabel!
    var motion = CMMotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myAccelerometer()
        myGyroscope()
    }

    func myAccelerometer() {
        print("Start Accelerometer")
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                
                self.xAcel!.text = "x: \(Double(x).rounded(toPlaces: 3))"
                self.yAcel!.text = "y: \(Double(y).rounded(toPlaces: 3))"
                self.zAcel!.text = "z: \(Double(z).rounded(toPlaces: 3))"
            }
        }

        return
    }
    
    
    func myGyroscope(){
        print("Start Gyroscope")
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                self.xgyro!.text = "x: \(Double(trueData.rotationRate.x).rounded(toPlaces: 3))"
                self.ygyro!.text = "y: \(Double(trueData.rotationRate.y).rounded(toPlaces: 3))"
                self.zgyro!.text = "z: \(Double(trueData.rotationRate.z).rounded(toPlaces: 3))"
            }
        }
        return
    }
 
}

extension Double {
     func rounded(toPlaces places:Int) -> Double {
         let divisor = pow(10.0, Double(places))
         return (self * divisor).rounded()
     }
 }
 
 
