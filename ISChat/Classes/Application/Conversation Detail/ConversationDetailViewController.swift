//
//  ConversationDetailViewController.swift
//  FBSnapshotTestCase
//
//  Created by admin on 14/5/18.
//

import UIKit

class ConversationDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    public init() {
        let bundle = Bundle(for: ConversationDetailViewController.self)
        super.init(nibName: "ConversationDetailViewController", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellBundle = Bundle(for: ConversationDetailViewController.self)
        let nib = UINib(nibName: "MyMessageTableViewCell", bundle: cellBundle)
        self.tableView.register(nib, forCellReuseIdentifier: "MyMessageTableViewCell")

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension ConversationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "MyMessageTableViewCell") as! MyMessageTableViewCell
    }
    
}
