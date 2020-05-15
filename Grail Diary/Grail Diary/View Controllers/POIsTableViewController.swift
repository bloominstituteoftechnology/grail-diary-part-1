//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Chris Gooley on 7/30/19.
//  Copyright © 2019 Chris Gooley. All rights reserved.
//

import UIKit

protocol AddPOIsDelegate {
    <#requirements#>
}

class POIsTableViewController: UIViewController {
    
    var pois: [POI] = []

    @IBOutlet weak var poisTableView: UITableView!
    
//    var delegate: POIsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
