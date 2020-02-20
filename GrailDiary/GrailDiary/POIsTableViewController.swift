//
//  ViewController.swift
//  GrailDiary
//
//  Created by Karen Rodriguez on 2/18/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        POITable.delegate = self
        POITable.dataSource = self
    }

    var models: [POI] = []
    
    @IBOutlet weak var POITable: UITableView!

    
    


}

// Delegate and DataSource functionality

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        
        cell.textLabel?.text = "We testing"
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let AddPOIVC = segue.destination as? AddPOIViewController else { fatalError()}
            AddPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            guard let DetailPOIVC = segue.destination as? POIDetailViewController,
                let indexPath = POITable.indexPathForSelectedRow else { fatalError()}
            DetailPOIVC.poi = models[indexPath.row]
            
        }
    }
}


extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        models.append(poi)
        dismiss(animated: true, completion: nil)
        POITable.reloadData()
    }
    
    
}
