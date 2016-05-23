//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Zach Mcmillan-Clenaghan on 23/05/2016.
//  Copyright © 2016 ClenTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    func updateTapLbl() {
        tapLbl.text = "\(currentTaps) Taps"
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
            if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
                logoImg.hidden = true
                playBtn.hidden = true
                howManyTapsTxt.hidden = true
                    
                tapBtn.hidden = false
                tapLbl.hidden = false

                maxTaps = Int(howManyTapsTxt.text!)!
                currentTaps = 0
                
                updateTapLbl()
        }
    }
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps += 1
        updateTapLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapBtn.hidden = true
        tapLbl.hidden = true
    }
    
    
}

