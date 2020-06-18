
import Foundation

struct Album: Codable {
    
    var albumImage: String
    var albumName: String
    var albumArtistName: String
    var albumInfo: String
    var albumSongs: [Song]
}

struct Song: Codable {
    
    var songNumber: Int
    var songName: String
    var artistName: String
    var trackName: String
    
}
