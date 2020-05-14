//
//  ViewController.swift
//  GrailDiary
//
//  Created by Violet Lavender Love on 5/12/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    let manyPOIs: [POI] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var POIsTableView: UITableView!
    

}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
