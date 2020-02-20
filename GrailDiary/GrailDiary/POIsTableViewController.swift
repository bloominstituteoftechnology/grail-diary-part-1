//
//  ViewController.swift
//  GrailDiary
//
//  Created by Mark Gerrior on 2/18/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var poi: [POI] = [POI(location: "Aulani",
                          country: "US",
                          clues: ["Hawaii", "Disney"])]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell") as? POITableViewCell else { return UITableViewCell() }
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
//        poi.app
    }
    
    
}
