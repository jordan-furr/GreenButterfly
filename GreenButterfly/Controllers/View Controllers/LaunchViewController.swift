//
//  LaunchViewController.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/14/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var viewforlayer: UIView!
    
    var layer: CALayer {
        return viewforlayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
    }
    
    func setUpLayer(){
        layer.contents = UIImage(named: "butterfly")?.cgImage
//        layer.shadowOpacity = 0.7
//        layer.shadowRadius = 5.0
    }
}
