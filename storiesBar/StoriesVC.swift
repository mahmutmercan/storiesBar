//
//  StoriesVC.swift
//  storiesBar
//
//  Created by Mahmut MERCAN on 22.03.2021.
//

import UIKit

class StoriesVC: UIViewController {

    @IBOutlet weak var storiesImageView: UIImageView!
    var name = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        storiesImageView.image = UIImage(named: name)
        // Do any additional setup after loading the view.
    }
    
}
