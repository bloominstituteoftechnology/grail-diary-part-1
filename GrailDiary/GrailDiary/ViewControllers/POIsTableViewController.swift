//
//  ViewController.swift
//  GrailDiary
//
//  Created by Violet Lavender Love on 5/12/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet var POIsTableView: UITableView!
    
    var manyPOIs: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


extension POIsTableViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return manyPOIs.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell is not of expected identifier POICell. If you are a user, I am very sorry. Please restart your app!")
        }
        let POI = manyPOIs[indexPath.row]
        
        cell.locationLabel.text = POI.location
        cell.countryLabel.text = POI.country
        cell.cluesLabel.text = "\(POI.clues.count) clue(s)"
        
        return cell
    }
  
    
}

extension POIsTableViewController: AddPOIDelegate {
    func POIWasAdded(poi: POI) {
        manyPOIs.append(poi)
        POIsTableView.reloadData()
    }
    
    
}
