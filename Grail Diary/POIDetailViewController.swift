//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Marcus Campbell on 5/28/20.
//  Copyright © 2020 Marcus Campbell. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}




class POIDetailViewController: UIViewController {
    @IBOutlet weak var Location: UITextField!
    @IBOutlet weak var Country: UITextField!
    @IBOutlet weak var Clue2: UITextField!
    @IBOutlet weak var Clue3: UITextField!
    @IBOutlet weak var Clue1: UITextField!
    
    @IBOutlet weak var Cancel: UIBarButtonItem!
    @IBOutlet weak var Save: UIBarButtonItem!
    
    var delegate:AddPOIDelegate?

    
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

extension AddPOIViewController: UITableViewDelegate {
    
}

extension AddPOIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
