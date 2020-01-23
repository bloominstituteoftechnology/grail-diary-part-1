//
//  ViewController.swift
//  GrailDiary
//
//  Created by Keri Levesque on 1/21/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    // step 7
    var pointsOfInterest: [POI] = []
    // step 8
    @IBOutlet weak var grailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension  POIsTableViewController: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             
             return pointsOfInterest.count
         }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             // Setting the cell equal to the same cell we added in the storyboard as the custom cell we will make changes to in our customViews folder. If it doesnt work, return a blank cell. Make sure you copy and past the string below.
             guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
             
             // Creating a new POI variable that is set to the specific POI that the cell contains.
             let POI = pointsOfInterest[indexPath.row]
             // setting the cell's poi to the POI we just created. Kind of like a segue.
             cell.poi = POI
             
             // After this is done, we will return the cell to be shown.
             return cell
             
         }
         
    }
