//
//  ConversationListViewController.swift
//  FBSnapshotTestCase
//
//  Created by admin on 10/5/18.
//

import UIKit

open class ConversationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chats: [Chat] = []
    private let reuseIdentifier = "ConversationCell"
    
    public init() {
        let bundle = Bundle(for: ConversationListViewController.self)
        super.init(nibName: "ConversationListViewController", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let chat = Chat()
        chats = [chat,chat,chat]
        
        let cellBundle = Bundle(for: ConversationTableViewCell.self)
        let nib = UINib(nibName: "ConversationTableViewCell", bundle: cellBundle)
        self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {return UITableViewCell()}
        return cell
    }
}
