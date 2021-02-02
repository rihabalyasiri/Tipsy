//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Rihab Al-yasiri on 02.02.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalLabelValue: String?
    var settingsLabelText : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalLabelValue
        settingLabel.text = settingsLabelText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    */
  
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
