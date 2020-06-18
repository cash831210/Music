

import UIKit

private let reuseIdentifier = "AlbumCollectionViewCell"

class AlbumCollectionViewController: UICollectionViewController {

    var albums = [Album]()
    
    
    func setupCellSize() {

            //item間距
            let itemSpace: CGFloat = 3
            //銀幕寬度放幾個items
            let columnCount: CGFloat = 2
            //離手機銀幕多少距離
            let inset: CGFloat = 10
            let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
            let width = floor((collectionView.bounds.width - itemSpace * (columnCount-1) - inset * 2) / columnCount)
            flowLayout?.itemSize = CGSize(width: width, height: width)
            flowLayout?.estimatedItemSize = .zero
            flowLayout?.minimumInteritemSpacing = itemSpace
            flowLayout?.minimumLineSpacing = itemSpace
            flowLayout?.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCellSize()
        //讀取MusicPList內容資料
        let url = Bundle.main.url(forResource: "MusicPList", withExtension: "plist")!
        if let data = try? Data(contentsOf: url), let albums = try? PropertyListDecoder().decode([Album].self, from: data) {
            //存擋放至albums
            self.albums = albums
            //讀取資料
            self.collectionView.reloadData()
        }
        
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let album = indexPath.item
        //點選哪個item傳值到指定頁面  （instantiate 建立的意思）
        guard let albumList = storyboard?.instantiateViewController(identifier: "AlbumListTableViewController") as? AlbumListTableViewController else{
            return
        }
        
        albumList.album = albums[album]
        
        show(albumList, sender: nil)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(albums.count)
        return albums.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlbumCollectionViewCell
    
        let album = albums[indexPath.item]
        
        cell.albumImageView.image = UIImage(named: album.albumImage)
        cell.albumNameLabel.text = album.albumName
    
        return cell
    }


}
