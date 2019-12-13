//
//  POITableViewController.swift
//  GrailDiary
//
//  Created by Michael on 12/12/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class POITableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var pointsOfInterest: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            addPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let detailPOIVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let pointOfInterest = pointsOfInterest[indexPath.row]
                detailPOIVC.pointOfInterest = pointOfInterest
            }
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension POITableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POITableViewCell", for: indexPath) as? POITableViewCell else { fatalError("The cell is not a POITableViewCell")}
        let pointOfInterest = pointsOfInterest[indexPath.row]
    
        cell.pointOfInterest = pointOfInterest
        
        return cell
    }
}

extension POITableViewController: AddPOIDelegate {
    func poiWasAdded(pointOfInterest: POI) {
        pointsOfInterest.append(pointOfInterest)
        dismiss(animated: false, completion: nil)
        tableView.reloadData()
    }
}
