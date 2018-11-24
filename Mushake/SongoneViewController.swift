//
//  SongoneViewController.swift
//  Mushake
//
//  Created by pzpopori's mac air on 14/11/2561 BE.
//  Copyright © 2561 kueyen_n. All rights reserved.
//

import UIKit
import AVFoundation


class SongoneViewController: UIViewController {
    
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var imageSong: UIImageView!
    @IBOutlet weak var labelSong: UILabel!
    
    var song = ["Thunderclouds (feat. Sia, Diplo & Labrinth)",
                "Audio  (feat. Sia, Diplo & Labrinth)",
                "Mountains  (feat. Sia, Diplo & Labrinth)",
                "Genius (feat. Sia, Diplo & Labrinth)"]
    
    var i = -1
    var audioPlayer: AVAudioPlayer!
    
    func playSoundWith(fileName: String, fileExtension: String) -> Void {
        
        let audioSourceURL: URL!
        audioSourceURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        if audioSourceURL == nil{
            print("Requested Song Cannot Be Played")
        }else {
            do {
                audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceURL!)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        song.shuffle()
        pauseBtn.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playBtn(_ sender: Any) {
        playBtn.isHidden = true
        pauseBtn.isHidden = false
        playSoundWith(fileName: "\(labelSong.text!)", fileExtension: "mp3")
        
        
      
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        pauseBtn.isHidden = true
        playBtn.isHidden = false
        audioPlayer.pause()

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        print(":::: Next Song Success ::::")
        NextMusic()
        playBtn.isHidden = true
        pauseBtn.isHidden = false
        
    }
    @IBAction func previousBtn(_ sender: Any) {
        print(":::: previous Song Success ::::")
        previousMusic()
        playBtn.isHidden = true
        pauseBtn.isHidden = false
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        print(" ::::: Device was shaken! ::::: ")
        RandomMusic()
        playBtn.isHidden = true
        pauseBtn.isHidden = false
    }

    func NextMusic() {
        
        i += 1
        if (i < song.count) {
            print("\(song[i])")
            let nextSong = song[i]
            playSoundWith(fileName: "\(nextSong)", fileExtension: "mp3")
            labelSong.text = nextSong
            
        } else if (i > song.count) {
            i = 0
            print("\(song[i])")
            let nextSong = song[i]
            playSoundWith(fileName: "\(nextSong)", fileExtension: "mp3")
            labelSong.text = nextSong
            
        }
        
    }
    func previousMusic() {
        
        i += -1
        if (i < song.count) {
            
            print("\(song[i])")
            let nextSong = song[i]
            playSoundWith(fileName: "\(nextSong)", fileExtension: "mp3")
            labelSong.text = nextSong
            
        } else if (i > song.count) {
            i = 0
            print("\(song[i])")
            let nextSong = song[i]
            playSoundWith(fileName: "\(nextSong)", fileExtension: "mp3")
            labelSong.text = nextSong
            
        }
        
    }
    
    func RandomMusic() {
        
        if (i < song.count) {
            
            let keySong = Int(arc4random_uniform(UInt32(song.count)))
            let songNorepeat = song.remove(at: keySong)
            print(songNorepeat)
            playSoundWith(fileName: "\(songNorepeat)", fileExtension: "mp3")
            labelSong.text = songNorepeat
            
            
        } else if (i > song.count) {
            i = 0
            let keySong = Int(arc4random_uniform(UInt32(song.count)))
            let songNorepeat = song.remove(at: keySong)
            print(songNorepeat)
            playSoundWith(fileName: "\(songNorepeat)", fileExtension: "mp3")
            labelSong.text = songNorepeat
            
        }
        
        
    }

}
