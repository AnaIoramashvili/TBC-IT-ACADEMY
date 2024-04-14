//
//  OnBoardingViewController.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "SecondPageBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var titleLabel: UILabel = {
        
    }

    override func viewDidLoad() {
        view.addSubview(backgroundView)
    }


}
