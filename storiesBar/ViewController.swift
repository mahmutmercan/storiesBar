//
//  ViewController.swift
//  storiesBar
//
//  Created by Mahmut MERCAN on 11.03.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "StoryCVC", bundle: nil), forCellWithReuseIdentifier: "StoryCVC")
        
        models.append(Model(text: "Story 1", imageName: "cars1"))
        models.append(Model(text: "Story 2", imageName: "cars2"))
        models.append(Model(text: "Story 3", imageName: "cars3"))
        models.append(Model(text: "Story 4", imageName: "cars4"))
        models.append(Model(text: "Story 5", imageName: "cars1"))
        models.append(Model(text: "Story 6", imageName: "cars2"))
        models.append(Model(text: "Story 7", imageName: "cars3"))
        models.append(Model(text: "Story 8", imageName: "cars4"))
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.collectionViewLayout = layout
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func configure(with models: [Model]) {
        self.models = models
        collectionView?.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCVC.identifier, for: indexPath) as! StoryCVC
        let models = self.models
        cell.secondImageView.contentMode = .scaleAspectFill
        cell.secondImageView.image = UIImage(named: models[indexPath.row].imageName)
        cell.titleLabel.text = models[indexPath.row].text
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? StoryCVC
        cell?.secondImageView.layer.borderWidth = 0
        cell?.titleLabel.textColor = .blue
        let vc = storyboard?.instantiateViewController(withIdentifier: "StoriesVC") as? StoriesVC
        vc?.name = models[indexPath.row].imageName
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 90)
    }

}

struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}
