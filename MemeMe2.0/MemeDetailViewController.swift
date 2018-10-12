//
//  MemeDetailViewController.swift
//  Experiment1
//
//  Created by Pete Chambers on 13/12/2017.
//  Copyright © 2017 Pete Chambers. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController, UIApplicationDelegate {
    
    @IBOutlet weak var MemeDetailImageView: UIImageView!
    
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
        MemeDetailImageView.image = meme.memedImage
        MemeDetailImageView.contentMode = .scaleAspectFit
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    
    
    
    
    
    
    
}
}
