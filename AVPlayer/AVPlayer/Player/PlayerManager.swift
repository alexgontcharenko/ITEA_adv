//
//  PlayerManager.swift
//  AVPlayer
//
//  Created by Steew on 17.08.2021.
//

import UIKit

class PlayerManager {
    private let player = Player.shared
    static let shared = PlayerManager()
    private var playlist = Stack<Song>(maxSize: 3)
    var index = 0
    private var currentSong: Song? {
        return playlist.getElement(by: index)
    }
    
    private init() {
        player.onSongFinished = songFinished
    }
    
    func songFinished() {
        
    }
    
    func addToPlaylist(songs: [Song]) {
        songs.forEach { (song) in
            playlist.push(song)
        }
    }
    
    func setCurrentSong(_ index: Int) {
        self.index = index
    }
    
    func playSong() {
        if player.getPlayerStatus() == .isReadyToPlay {
            player.play()
            return
        }
        player.prepareToPlay(currentSong!)
        playSong()
    }
    
    func pauseSong() {
        player.pause()
    }
    
}


