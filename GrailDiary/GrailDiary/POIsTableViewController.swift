//
//  ViewController.swift
//  GrailDiary
//
//  Created by Mark Poggi on 3/17/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = [POI(location: "Los Angeles", country: "United States", clues: ["Hollywood"])]
     // need a protocal called UITableViewDataSource to get the data in the table
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // set the view controller as the delegate (data source) of the table view.
        
        tableView.dataSource = self
        
    }
    
    
// MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     // Get the new view controller using segue.destination.
        
     if segue.identifier == "AddPOIModalSegue" {
     
     guard let newPOIVC = segue.destination as? AddPOIViewController else { return }
     
     
     // sets up this view controller to receive the information passed from the newFriendVC using ther delegate pattern
     
     newPOIVC.delegate = self
        
        }

     // Pass the selected object to the new view controller.

    }
    
}


// 9. In an extension, make this class conform to the `UITableViewDataSource` protocol

extension POIsTableViewController: UITableViewDataSource {
    
    // 10. Implement the following protocol methods: `tableView(_:numberOfRowsInSection:)` and `tableView(_:cellForRowAt:indexPath:)`
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
        
        // provides number of rows.
    }
    
    // 11. Set the view controller as the delegate and data source for the table view.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError()
        }
        
        let poi = pois[indexPath.row]
        
        cell.locationTextField.text = poi.location
        cell.countryTextField.text = poi.country
        cell.cluesTextField.text = "\(poi.clues.count) clues."
        
        
        
        return cell
        
    }
    
}

extension POIsTableViewController: AddPOIDelegate {
    
    // when the NewFriendViewControler tells us there is a new friend what do we want?
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
        
        
    }
}
