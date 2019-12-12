//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Kenny on 12/7/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var poiModels: [POI]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "POICell") {
            return cell
        }
        return UITableViewCell()
    }
    
    
}
