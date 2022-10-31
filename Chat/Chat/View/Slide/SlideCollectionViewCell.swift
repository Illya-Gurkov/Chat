//
//  SlideCollectionViewCell.swift
//  Chat
//
//  Created by Illya Gurkov on 29.10.22.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var regBtn: UIButton!
    
    @IBOutlet weak var authBtn: UIButton!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var slideImg: UIImageView!
    
    var delegate: LoginViewControllerDelegate!
    
    static let reuceId = "SlideCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func regBtnCkick(_ sender: Any) {
        delegate.openRegVC()
    }
    
    @IBAction func authBtnClick(_ sender: Any) {
        delegate.openAuthVC()
    }
    
    func configure(slide: Slides){
        slideImg.image = slide.img
        descriptionText.text = slide.text
        if slide.id == 3 {
            regBtn.isHidden = false
            authBtn.isHidden = false
        }
    }
}
