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
        let nibMM = UINib(nibName: "MyMessageTableViewCell", bundle: cellBundle)
        let nibOM = UINib(nibName: "OtherMessageTableViewCell", bundle: cellBundle)
        self.tableView.register(nibMM, forCellReuseIdentifier: "MyMessageTableViewCell")
        self.tableView.register(nibOM, forCellReuseIdentifier: "OtherMessageTableViewCell")

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(_keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(_keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc private func _keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let _duration = userInfo[UIKeyboardAnimationDurationUserInfoKey]else { return }
        guard let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] else { return }
        guard let keyboardFrameEnd = userInfo[UIKeyboardFrameEndUserInfoKey] else { return }
        
        let curveOption = UIViewAnimationOptions(rawValue: UInt((curve as AnyObject).integerValue << 16))
        let keyboardFrameEndRectFromView = view.convert((keyboardFrameEnd as AnyObject).cgRectValue, from: nil)
        let duration = (_duration as AnyObject).doubleValue ?? 1.0
        let viewAnimationOptions: UIViewAnimationOptions = [curveOption, .beginFromCurrentState]
        
        keyboardWillShow(endRect: keyboardFrameEndRectFromView, duration: duration, animationOptions: viewAnimationOptions)
    }
    
    @objc private func _keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let _duration = userInfo[UIKeyboardAnimationDurationUserInfoKey]else { return }
        guard let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] else { return }
        
        let curveOption = UIViewAnimationOptions(rawValue: UInt((curve as AnyObject).integerValue << 16))
        let duration = (_duration as AnyObject).doubleValue ?? 1.0
        let viewAnimationOptions: UIViewAnimationOptions = [curveOption, .beginFromCurrentState]
        
        keyboardWillHide(duration: duration, animationOptions: viewAnimationOptions)
    }
    
    func keyboardWillShow(endRect: CGRect, duration: Double, animationOptions: UIViewAnimationOptions) {}
    func keyboardWillHide(duration: Double, animationOptions: UIViewAnimationOptions) {}

}

extension ConversationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "MyMessageTableViewCell") as! MyMessageTableViewCell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: "OtherMessageTableViewCell") as! OtherMessageTableViewCell
        }
    }
    
}
