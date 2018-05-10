//
//  ConversationListViewController.swift
//  FBSnapshotTestCase
//
//  Created by admin on 10/5/18.
//

import UIKit

open class ConversationListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var chats: [Chat] = []
    private let reuseIdentifier = "ConversationCell"
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "ConversationCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}

extension ConversationListViewController : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {return UITableViewCell()}
        return cell
    }
}
