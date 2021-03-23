//
//  StoryCVC.swift
//  storiesBar
//
//  Created by Mahmut MERCAN on 19.03.2021.
//

import UIKit

class StoryCVC: UICollectionViewCell {
    
    static let identifier = "StoryCVC"
    
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
                    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code
    }
    
    public func configure(name: String, label: String) {
        secondImageView.image = UIImage(named: name)
        titleLabel.text = label
    }
    
    func setupCell() {
        secondImageView.clipsToBounds = true
        secondImageView.layer.cornerRadius = 70/2
        secondImageView.layer.borderWidth = 2
        secondImageView.layer.borderColor = UIColor.link.cgColor
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
    }

}
