//
//  MeaasgeCell.swift
//  FireBase
//
//  Created by Kaplan2 on 31/05/23.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
