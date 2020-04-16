//
//  ViewController.swift
//  Grail Diary
//
//  Created by Kelson Hartle on 4/14/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableViewPOIList: UITableView!
    
    var pointsOfInterest: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPOIList.delegate = self
        tableViewPOIList.dataSource = self
        
    }
    
    
}

extension POIsTableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pointsOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

extension POIsTableViewController: UITableViewDelegate {
    
    
}


extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}


