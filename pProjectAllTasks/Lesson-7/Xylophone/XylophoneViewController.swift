//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {
    
    var xylophoneModel = LessonModel(name: "Seventh lesson", type: "Music", imageData: #imageLiteral(resourceName: "ETH"), withIdentifire: "XylophoneVC", storyboardName: "Xylophone")
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        playSound(soundName: sender.currentTitle ?? "C")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
    func playSound (soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}

