//
//  POIsTableViewController.swift
//  GrailDairy
//
//  Created by alfredo on 11/17/19.
//  Copyright © 2019 alfredo. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    // MARK: - IBOutlets
    // 8. Create an `IBOutlet` to link the table view to your code; wire up this outlet to the table view in the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    var POIModels: [POI] = [] // 7. Create an array property to store your `POI` models
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
    }
    //27. In the main class definition, implement the `prepare(for:sender:)` method (it might be commented out)
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //28. Check the identifier of the segue first; look for the identifier `AddPOIModalSegue`
       //29. If that identifier is found, use the segue object's `destination` property to grab the view controller we're transitioning to and cast it as an instance of `AddPOIViewController`; you'll need to unwrap this as the cast may not succeed
       if segue.identifier == "AddPOIModalSegue" {
           //30. If the unwrap is successful, use the view controller you unwrapped, set its `delegate` property to `self`; this ensures the `POIsTableViewController` will act on behalf of the `AddPOIViewController`
           if let addPOIVC = segue.destination as? AddPOIViewController {
               addPOIVC.delegate = self
           }
       }
       //39. In the `prepare(for:sender:)` method, add an `else-if` to your existing code to check for a different segue identifier, `ShowPOIDetailSegue`
       else if segue.identifier == "ShowPOIDetailSegue" {
           //40. If that identifier is found, unwrap the selected row's index path from the tableview, and then grab the segue's destination view controller and cast it as an instance of `POIDetailViewController` (do these two steps together in a compound `if-let`)
           if let indexPath = tableView.indexPathForSelectedRow,
               let poiDetailVC = segue.destination as? POIDetailViewController {
               //41. If those unwraps are successful, set the detail view controller's `poi` property to the appropriate `POI` from the array you use in this class to track all POIs
               poiDetailVC.poi = POIModels[indexPath.row]
           }
       }
   }
}

extension POIsTableViewController: UITableViewDataSource //9. In an extension, make this class conform to the `UITableViewDataSource` protocol
{
    //10. Implement the following protocol methods: `tableView(_:numberOfRowsInSection:)` and `tableView(_:cellForRowAt:indexPath:)`
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let POI = POIModels[indexPath.row]
        cell.poi = POI
        
        return cell
        
    }
}

// 22. In an extension, make the class conform to the `AddPOIDelegate` protocol
extension POIsTableViewController: AddPOIDelegate{
    func poiWasAdded(_ poi: POI) {
        POIModels.append(poi) //24. Append the poi that was passed into the method to your array
        dismiss(animated: true, completion: nil) //25. Dismiss the view so the modal animates offscreen
        self.tableView.reloadData()//26. Reload the tableview's data
//        print(poi)
//        print(POIModels[0])
    }
}
