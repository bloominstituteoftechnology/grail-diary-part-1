//
//  ViewController.swift
//  GrailDiary
//
//  Created by ronald huston jr on 4/14/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var points: [POI] = [POI(location: "St John's", country: "Malta", clues: ["skull", "racket", "dagger"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            guard let destination = segue.destination as? AddPOIViewController else { return }
            destination.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            
            guard let destination = segue.destination as? POIDetailViewController,
                let selectedCell = tableView.indexPathForSelectedRow?.row else { return }
            
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return points.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  unwrap custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            else { fatalError() }
        
        let point = points[indexPath.row]
        cell.locationLabel?.text = point.location
        cell.countryLabel?.text = point.country
        cell.cluesLabel?.text = "\(point.clues.count) clues"
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func pointWasAdded(point: POI) {
        points.append(point)
        self.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
