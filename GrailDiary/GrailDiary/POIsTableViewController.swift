//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Drew Miller on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
    
    var poi: [POI] = [POI]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
        fatalError("Cell identifier is wrong")
    } 
    }

    @IBOutlet weak var tableViewOutlet: POITableViewCell!

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
