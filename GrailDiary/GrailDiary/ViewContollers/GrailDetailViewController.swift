//
//  GrailDetailViewController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class GrailDetailViewController: UIViewController {
    
    var grailController: GrailController?

    @IBOutlet weak var grailImageView: UIImageView!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
