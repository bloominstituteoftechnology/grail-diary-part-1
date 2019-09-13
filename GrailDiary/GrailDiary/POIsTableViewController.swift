//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Niranjan Kumar on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var models: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Look at the prepare(for segue: method again)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
            let addPOIVC = segue.destination as? POIDetailViewController {
                addPOIVC.poi = models[indexPath.row]
            }
        }
    }
    // Review above

}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as?
            POITableViewCell else {return UITableViewCell ()}
        
//
        
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        models.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}
