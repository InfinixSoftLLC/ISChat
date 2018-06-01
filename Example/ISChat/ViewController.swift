//
//  ViewController.swift
//  ISChat
//
//  Created by fmo91 on 05/10/2018.
//  Copyright (c) 2018 fmo91. All rights reserved.
//

import UIKit
import ISChat

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testAPIClient()
    }
    
    @IBAction func testBtnPress() {
        let vc = ConversationListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

