//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by yuming.zheng on 2023/6/6.
//

import UIKit

class NoteEditVC: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    let photos = [
        UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}

extension NoteEditVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        cell.imageView.image = photos[indexPath.row]
//        cell.contentView.layer.cornerRadius = 10
        return cell
    }
    
    
}

extension NoteEditVC: UICollectionViewDelegate{
    
}
