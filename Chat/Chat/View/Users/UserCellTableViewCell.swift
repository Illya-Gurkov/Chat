//
//  UserCellTableViewCell.swift
//  Chat
//
//  Created by Illya Gurkov on 1.11.22.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    static let reuseId = "UserCellTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        settingCell()
    }
    
    func configCell(_ name: String){
        userName.text = name
    }
    
    func settingCell(){
        parentView.layer.cornerRadius = 10
        userImage.layer.cornerRadius = userImage.frame.width/2
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
