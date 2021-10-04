//
//  ViewController.swift
//  AVPlayer
//
//  Created by lvorozhbyt on 2021-08-15.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var songTitle: UILabel!
    private let playerManager = PlayerManager.shared
    
    private var avPlayer: AVQueuePlayer?
    private var player: AVPlayer?
    private var isPlaying = false
    
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var songSlider: UISlider!
    public var selectedSong: Int?
    private var playerItem: AVPlayerItem?
    private let audioItems: [AVPlayerItem] = [
        AVPlayerItem(url: Bundle.main.url(forResource: "perry", withExtension: "mp3")!),
        AVPlayerItem(url: Bundle.main.url(forResource: "example", withExtension: "mp3")!),
        AVPlayerItem(url: Bundle.main.url(forResource: "acdc", withExtension: "mp3")!)
    ]
    private let titles = ["Katy Perry", "Exemple Song", "Hells Bells"]
    
    @IBOutlet weak var playNext: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var prevPlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avPlayer = AVQueuePlayer(playerItem: playerItem)
        play(at: selectedSong ?? 0)
        
        let _ = avPlayer!.addPeriodicTimeObserver(
            forInterval: CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC)),
            queue: DispatchQueue.main) { [weak self] (time) in
            let duration = CMTimeGetSeconds((self?.avPlayer!.currentItem!.asset.duration)!)
            self?.songSlider.value = Float(CMTimeGetSeconds(time)) / Float(duration)
        }
        
        let duration = CMTimeGetSeconds(avPlayer!.currentItem!.asset.duration)
        let minutesTextOut = Int(duration) / 60 % 60
        let secondsTextOut = Int(duration) % 60
        let strDuration = String(format:"%02d:%02d", minutesTextOut, secondsTextOut)
        endTime.text = strDuration
    }
    
    @IBAction func prevTrack(_ sender: Any) {
        var index = audioItems.firstIndex(of: (avPlayer?.currentItem!)!) ?? 0
        if index > 0 {
            index = index - 1
        }
        songTitle.text = titles[index]
        play(at: index)
    }
    
    @IBAction func playPauseTrack(_ sender: Any) {
        if !isPlaying {
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            play(at: selectedSong ?? 0)
            return
        }
        playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        pause()
        isPlaying = !isPlaying
    }
    
    @IBAction func nextTrack(_ sender: Any) {
        var index = audioItems.firstIndex(of: (avPlayer?.currentItem!)!) ?? 0
        if index < (audioItems.count - 1) {
            index = index + 1
        }
        songTitle.text = titles[index]
        play(at: index)
    }
    
    func play(at index: Int) {
        avPlayer?.removeAllItems()
        playerItem = audioItems[index]
        avPlayer?.insert(playerItem!, after: nil)
        avPlayer?.play()
        isPlaying = true
        songTitle.text = titles[index]
    }
    
    func pause() {
        avPlayer?.pause()
    }
    @IBAction func slideSong(_ sender: Any) {
        let duration = CMTimeGetSeconds(avPlayer!.currentItem!.asset.duration)
        let value = songSlider.value
        let durationToSeek = Float(duration) * value
        
        avPlayer?.seek(to: CMTimeMakeWithSeconds(Float64(durationToSeek),preferredTimescale: avPlayer!.currentItem!.duration.timescale)) { [](state) in
            
            if (self.playPauseButton.backgroundImage(for: .normal)?.isEqual(UIImage(named: "play.fill")))! {
                self.avPlayer?.pause()
            } else if (self.playPauseButton.backgroundImage(for: .normal)?.isEqual(UIImage(named: "pause.fill")))!{
                self.avPlayer?.play()
            }
        }
    }
    
}

