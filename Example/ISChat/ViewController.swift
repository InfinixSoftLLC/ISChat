//
//  ViewController.swift
//  ISChat
//
//  Created by fmo91 on 05/10/2018.
//  Copyright (c) 2018 fmo91. All rights reserved.
//

import UIKit
import Pods_ISChat_Example

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.present(ConversationListViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

