//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Jesse Ruiz on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var POIModelsArray: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIModelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poi.append(POIModelsArray)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
}
