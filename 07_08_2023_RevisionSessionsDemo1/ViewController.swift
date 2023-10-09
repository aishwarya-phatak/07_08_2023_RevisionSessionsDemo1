//
//  ViewController.swift
//  07_08_2023_RevisionSessionsDemo1
//
//  Created by Vishal Jagtap on 07/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var productImages = ["imageFlag","nature_image2","nature_image4","pulavImage","smaosaImage"]
    
    private let productCellectionViewCellIdentifier : String = "ProductCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.backgroundColor = .lightGray
        registerXIBWithCollectionView()
        initializeCollectionView()
    }

    func initializeCollectionView(){
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
    }
    
    func registerXIBWithCollectionView(){
        let uiNib = UINib(nibName: productCellectionViewCellIdentifier, bundle: nil)
        imagesCollectionView.register(uiNib, forCellWithReuseIdentifier: productCellectionViewCellIdentifier)
    }
}

extension ViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionViewCell = self.imagesCollectionView.dequeueReusableCell(withReuseIdentifier: productCellectionViewCellIdentifier, for: indexPath) as? ProductCollectionViewCell
    
        productCollectionViewCell?.productImageView.layer.cornerRadius = 10.0
        
        productCollectionViewCell?.layer.borderWidth = 5.0
        productCollectionViewCell!.layer.borderColor = CGColor(
            red: 50.0,
            green: 0.0,
            blue: 50.0,
            alpha: 5.0)
        
        productCollectionViewCell?.layer.cornerRadius = 20.0
        
        productCollectionViewCell?.productImageView.image = UIImage(named: productImages[indexPath.row])
        
        return productCollectionViewCell!
    }
}

extension ViewController : UICollectionViewDelegate{
    
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
}
