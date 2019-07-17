//
//  POIsTableViewController.swift
//  ios-8-grail-diary
//
//  Created by Alex Shillingford on 7/16/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var poiTableView: UITableView!
    var poiList : [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            
            addPOIVC.delegate = self
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiList.append(poi)
        dismiss(animated: true, completion: nil)
        poiTableView.reloadData()
    }
    
    
}
