//
//  ViewController.swift
//  GrailDairy
//
//  Created by Juan M Mariscal on 1/30/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var poi: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
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




