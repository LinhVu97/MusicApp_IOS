//
//  ViewController.swift
//  Music App
//
//  Created by Vũ Linh on 27/04/2021.
//

import UIKit

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var song = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureSongs()
    }

    func configureSongs() {
        song.append(Song(name: "Havana",
                         albumName: "Havana",
                         artistName: "Titan",
                         imageName: "cover3",
                         trackName: "song3"))
        
        song.append(Song(name: "Viva La Vida",
                         albumName: "123 Something",
                         artistName: "ColdPlay",
                         imageName: "cover2",
                         trackName: "song2"))
        
        song.append(Song(name: "Perfect",
                         albumName: "Love",
                         artistName: "Ed Shearen",
                         imageName: "cover1",
                         trackName: "song1"))
        
        song.append(Song(name: "Havana",
                         albumName: "Havana",
                         artistName: "Titan",
                         imageName: "cover3",
                         trackName: "song3"))
        
        song.append(Song(name: "Viva La Vida",
                         albumName: "123 Something",
                         artistName: "ColdPlay",
                         imageName: "cover2",
                         trackName: "song2"))
        
        song.append(Song(name: "Perfect",
                         albumName: "Love",
                         artistName: "Ed Shearen",
                         imageName: "cover1",
                         trackName: "song1"))
        
        song.append(Song(name: "Havana",
                         albumName: "Havana",
                         artistName: "Titan",
                         imageName: "cover3",
                         trackName: "song3"))
        
        song.append(Song(name: "Viva La Vida",
                         albumName: "123 Something",
                         artistName: "ColdPlay",
                         imageName: "cover2",
                         trackName: "song2"))
        
        song.append(Song(name: "Perfect",
                         albumName: "Love",
                         artistName: "Ed Shearen",
                         imageName: "cover1",
                         trackName: "song1"))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        let songDetail = song[indexPath.row]
        cell.textLabel?.text = songDetail.name
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 17)
        
        cell.detailTextLabel?.text = songDetail.artistName
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        
        cell.imageView?.image = UIImage(named: "\(songDetail.imageName)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present player
        let position = indexPath.row
        // songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        
        vc.songs = song
        vc.position = position
//        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
