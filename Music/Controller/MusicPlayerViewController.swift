
import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
     /*
     目前尚缺功能：
     1.大、小音量按鈕
     2.控制歌曲進度拉桿
     3.當前歌曲播放結束後接續下一首歌
     */
    
    //專輯封面
    @IBOutlet weak var albumImageView: UIImageView!
    //歌曲播放進度條拉桿
    @IBOutlet weak var songProgressSlider: UISlider!
    //歌曲播放時間（目前時間、剩餘時間）
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var remainTimeLabel: UILabel!
    //歌曲資訊（歌名、作者、專輯名稱）
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    //上一首、播放/暫停按鈕、下一首
    @IBOutlet weak var playPauseButton: UIButton!
    //音量拉桿
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    var audioPlayer = AVAudioPlayer()
    
    var album : Album!
    
    var selectSong: Song!
    
    var songIndex: Int!
    
    var isPlaying = true
    
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumImageView.image = UIImage(named: album.albumImage)
        setTimer()
        refreshSongInfo()
        //播放選取歌曲
        if let urlString = Bundle.main.path(forResource: selectSong.trackName, ofType: "mp3") {
            try? audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            play()
        }
        //設定接續播放狀態
       
        
        
    }
    
    //控制歌曲進度拉桿（未完成）
    @IBAction func songProgressChange(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(sender.value)
    }
    
    //控制音量拉桿
    @IBAction func volumeChangeSlider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    @IBAction func tapLowSound(_ sender: Any) {
        print("音量減一")
    }
    @IBAction func tapHighSound(_ sender: Any) {
        print("音量加一")
    }
    
    func play() {//播放功能
        isPlaying = true
        audioPlayer.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
    }
    
    func pause() {//暫停功能
        isPlaying = false
        audioPlayer.pause()
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    
    func refreshSongInfo() {//更新歌曲資訊（歌名、作者、專輯名稱）
        
        songNameLabel.text = selectSong.songName
        artistNameLabel.text = selectSong.artistName
        albumNameLabel.text = album.albumName
        
    }
    
    
    
    func setTimer() {//設定時間器
        timer.invalidate()
        //啟動時間器 設定每一秒重複做事
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (timer) in
            guard let self = self else { return }
            //做什麼事？
            //目前時間
            self.currentTimeLabel.text = self.timeConverter(self.audioPlayer.currentTime, withMinus: false)
            //剩餘時間
            let remainTime = self.audioPlayer.duration - self.audioPlayer.currentTime
            self.remainTimeLabel.text = self.timeConverter(remainTime, withMinus: true)
            //進度條
            self.songProgressSlider.value = Float(self.audioPlayer.currentTime / self.audioPlayer.duration)
        })
    }
    
    func timeConverter(_ timeInSecond: Double, withMinus: Bool) -> String {
        //設定時間顯示方法
        let minute = Int(timeInSecond) / 60
        let second = Int(timeInSecond) % 60
        if withMinus == true {
            return second < 10 ? "-\(minute):0\(second)" : "-\(minute):\(second)"
        } else {
            return second < 10 ? "\(minute):0\(second)" : "\(minute):\(second)"
        }
    }
    
    @IBAction func tapPlayPause(_ sender: Any) {//按下按鈕（播放/暫停）
        
        if isPlaying == true {
            pause()
        }else {
            play()
        }
        
    }
    
    @IBAction func tapNext(_ sender: Any) { //按下一首
        setNextSong()
        refreshSongInfo()
        play()
    }
    
    @IBAction func tapBack(_ sender: Any) { //按上一首
        setBackSong()
        refreshSongInfo()
        play()
    }
    
    func setBackSong() {//設定上一首 到底重新播放第一首
        
        if songIndex == 0 {
            selectSong = album.albumSongs[songIndex]
            if let urlString = Bundle.main.path(forResource: selectSong.trackName, ofType: "mp3") {
                try? audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            }
        }
            
        else{
            songIndex = songIndex - 1
            selectSong = album.albumSongs[songIndex]
            if let urlString = Bundle.main.path(forResource: selectSong.trackName, ofType: "mp3") {
                try? audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            }
        }
    }
    
    func setNextSong() {//設定下一首 到最後一首時不做事
        
        if songIndex == album.albumSongs.count - 1 {
            return
        }
            
        else{
            songIndex = songIndex + 1
            selectSong = album.albumSongs[songIndex]
            if let urlString = Bundle.main.path(forResource: selectSong.trackName, ofType: "mp3") {
                try? audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            }
        }
    }
    
    
    
}
