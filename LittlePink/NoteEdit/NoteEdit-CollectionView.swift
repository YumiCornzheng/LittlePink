//
//  NoteEdit-CollectionView.swift
//  LittlePink
//
//  Created by yuming.zheng on 2024/2/21.
//

import YPImagePicker
import SKPhotoBrowser
import AVKit


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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isVideo{
            let playVC = AVPlayerViewController()
            playVC.player = AVPlayer(url: videoUrl!)
            present(playVC, animated: true){
                playVC.player?.play()
            }
        }else{
            // 1. create SKPhoto Array from UIImage
            var images = [SKPhoto]()
            photos.forEach { image in
                images.append(SKPhoto.photoWithImage(image))
            }
            
            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images,initialPageIndex: indexPath.item)
            browser.delegate = self
            SKPhotoBrowserOptions.displayAction = false //让分享按钮消失
            SKPhotoBrowserOptions.displayDeleteButton = true //增加删除按钮
            present(browser, animated: true)
            
        }
    }
}

extension NoteEditVC: SKPhotoBrowserDelegate{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()
    }
}

extension NoteEditVC{
    @objc private func addPhoto(){
        if photoCount < kMaxPhotoCount{
            var config = YPImagePickerConfiguration()
//            config.isScrollToChangeModesEnabled = false
//            config.onlySquareImagesFromCamera = false
            config.albumName = Bundle.main.appName
            config.screens = [.library]
            config.startOnScreen = .library
            
//            config.maxCameraZoomFactor = kMaxCameraZoomFactor
            config.library.preSelectItemOnMultipleSelection = false
            config.library.defaultMultipleSelection = true //可以多选
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount
            config.library.spacingBetweenItems = kSpacingBetweenItems
            
            config.gallery.hidesRemoveButton = false
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, _ in
                for item in items{
                    if case let .photo(photo) = item{
                        self.photos.append(photo.image)
                    }
                }
                
                self.photoCollectionView.reloadData()
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        }else{
            self.showTextHUD("最多只能放\(kMaxPhotoCount)张照片哦")
        }
    }
}
