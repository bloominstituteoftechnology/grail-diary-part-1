//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Ian Becker on 5/14/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!

    var poi: POI? { didSet { updateViews() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel?.text = poi.location
        countryLabel?.text = poi.country
        cluesTextView?.text = poi.clues
        }
    }
