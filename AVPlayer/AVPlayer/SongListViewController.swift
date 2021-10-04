//
//  SongListViewController.swift
//  AVPlayer
//
//  Created by Steew on 19.09.2021.
//

import UIKit

class SongListViewController: UIViewController {
    @IBOutlet weak var songsTableView: UITableView!
    private let songs = [
        Song(url: Bundle.main.url(forResource: "perry", withExtension: "mp3")!, title: "Perry"),
        Song(url: Bundle.main.url(forResource: "example", withExtension: "mp3")!, title: "Example"),
        Song(url: Bundle.main.url(forResource: "acdc", withExtension: "mp3")!, title: "AC/DC")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTableView.delegate = self
        songsTableView.dataSource = self
    }
}

extension SongListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell")!
        cell.textLabel?.text = songs[indexPath.row].title

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playerVC = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        playerVC.modalPresentationStyle = .fullScreen
        playerVC.selectedSong = indexPath.row
        present(playerVC, animated: true, completion: nil)
    }
    
}
