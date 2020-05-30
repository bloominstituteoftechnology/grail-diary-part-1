//
//  ViewController.swift
//  GrailDairy
//
//  Created by Sam Gutierrez on 5/22/20.
//  Copyright © 2020 Sam Gutierrez.inc. All rights reserved.
//

import UIKit

class POITableViewController: UIViewController {
    
    @IBOutlet weak var POITableView: UITableView!
   
    var listOfPOIs: [PointOfInterest] = [PointOfInterest(location: "LA", country: "USA", clues: ["Country has 50 states"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        POITableView.delegate = self
        POITableView.dataSource = self
        
    }
}

extension POITableViewController: UITableViewDelegate {
    
}

extension POITableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPOIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = POITableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
        
        return cell
    }
}
