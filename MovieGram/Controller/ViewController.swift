//
//  ViewController.swift
//  MovieGram
//
//  Created by zeyad on 2/15/20.
//  Copyright © 2020 zeyad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        API.getRecommendation(id: 496243) { (movies) in
            
        }
    }


}

