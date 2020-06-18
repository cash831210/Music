
import UIKit

private let reuseIdentifier = "AlbumListTableViewCell"

class AlbumListTableViewController: UITableViewController {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumArtistNameLabel: UILabel!
    
    @IBOutlet weak var albumInfoLabel: UILabel!
    
    var album: Album!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumImageView.image = UIImage(named: album.albumImage)
        albumNameLabel.text = album.albumName
        albumArtistNameLabel.text = album.albumArtistName
        albumInfoLabel.text = album.albumInfo
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let song = album.albumSongs[indexPath.row]
        
        guard let playerList = storyboard?.instantiateViewController(identifier: "MusicPlayerViewController") as? MusicPlayerViewController
            else{
                return
        }
        
        playerList.songIndex = indexPath.row
        playerList.selectSong = song
        playerList.album = album
        
        present(playerList, animated: true)
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return album.albumSongs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AlbumListTableViewCell
        let song = album.albumSongs[indexPath.row]
        //設定Album列表清單的cell內容
        cell.songNumberLabel.text = String (song.songNumber)
        cell.songNameLabel.text = song.songName
        cell.artistNameLabel.text = song.artistName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
  
}
