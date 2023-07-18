//
//  ViewController.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import UIKit
import os.log
class ViewController: UIViewController {

    let factory = SlideFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...4{

            let slide =  factory.createRandomSlide()
            slide.alpha = AlphaLevel(rawValue: Int.random(in: 0...9)) ?? .level1
            os_log("Rect\(i) \(slide.description)")
            
            
        }
        
    

        
        
       
        
    }


}

