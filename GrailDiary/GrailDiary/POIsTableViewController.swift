//
//  ViewController.swift
//  GrailDiary
//
//  Created by Chris Gonzales on 1/21/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

extension POIsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "POITableViewCell", for: indexPath)
        return cell
    }
    
    
    
}

class POIsTableViewController: UIViewController {

    let pOIs: [POI] = []
    
    @IBOutlet weak var pOITableView: UITableView!
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

