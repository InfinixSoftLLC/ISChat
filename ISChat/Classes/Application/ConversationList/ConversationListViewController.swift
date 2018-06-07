//
//  ConversationListViewController.swift
//  FBSnapshotTestCase
//
//  Created by admin on 10/5/18.
//

import UIKit

open class ConversationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Views -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes -
    var chats: [Chat] = []
    let api : APIClient
    private let reuseIdentifier = "ConversationCell"
    
    // MARK: - Life cycle -
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        let cellBundle = Bundle(for: ConversationTableViewCell.self)
        let nib = UINib(nibName: "ConversationTableViewCell", bundle: cellBundle)
        self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        api.getChats(onSuccess: { (chats) in
            self.chats = chats
            self.tableView.reloadData()
        }, onError: {(error) in
            print("Error")
        })
    }
    
    // MARK: - Init -
    public init(configuration: NetworkConfiguration) {
        self.api = APIClient(configuration: configuration)
        
        let bundle = Bundle(for: ConversationListViewController.self)
        super.init(nibName: "ConversationListViewController", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // "http://admin.enjifit.com/api/v1"
    
    // MARK: - UITableViewDelegate, UITableViewDataSource -
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier),
            let conversationCell = cell as? ConversationTableViewCell
        else {return UITableViewCell()}
        
        conversationCell.configure(name: chats[indexPath.row].userReceiverName ?? "No Handle")
        return conversationCell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ConversationDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
