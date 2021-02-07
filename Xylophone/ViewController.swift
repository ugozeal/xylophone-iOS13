//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    @IBOutlet weak var buttonC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        guard let soundTitle = sender.currentTitle else { return }
        playSound(soundTitle: soundTitle)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundTitle: String) {
        
        guard let url = Bundle.main.url(forResource: soundTitle, withExtension: "wav") else { return }
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    

}

