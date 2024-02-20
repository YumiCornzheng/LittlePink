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
        UIImage(named: "1"),UIImage(named: "2")
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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            photoFooter.addPhotoBtn.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            return photoFooter
        default:
            fatalError("UICollectionView的footer有问题")
        }
    }
    
    
}

extension NoteEditVC: UICollectionViewDelegate{
    
}

extension NoteEditVC{
    @objc private func addPhoto(){
        print("xxxxxx")
    }
}
