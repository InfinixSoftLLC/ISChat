//
//  ConversationTableViewCell.swift
//  FBSnapshotTestCase
//
//  Created by admin on 10/5/18.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var completedNameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
//        self.profileImageView.clipsToBounds = YES;
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
