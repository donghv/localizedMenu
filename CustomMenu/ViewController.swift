//
//  ViewController.swift
//  CustomMenu
//
//  Created by Dong Hoang on 3/5/17.
//  Copyright © 2017 Dong Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var languageSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func languageSegmentChanged(_ sender: Any) {
        switch languageSegment.selectedSegmentIndex {
        case 1:
            LocalizedManager.shared.languageKey = LanguageKey.Japanese
        case 2:
            LocalizedManager.shared.languageKey = LanguageKey.French
        default:
            LocalizedManager.shared.languageKey = LanguageKey.English
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

