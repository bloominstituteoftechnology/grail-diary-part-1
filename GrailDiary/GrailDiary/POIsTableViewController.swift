//
//  ViewController.swift
//  GrailDiary
//
//  Created by ronald huston jr on 4/14/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var points: [POI] = [POI(location: "St John's", country: "Malta", clues: ["skull", "racket", "dagger"])]

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return points.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError() }
        
        let point = points[indexPath.row]
        
//      return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func pointWasAdded(point: POI) {
        points.append(point)
        self.dismiss(animated: true, completion: nil)
//      tableView.reloadData() 
    }
}
