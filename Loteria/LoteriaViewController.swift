//
//  ViewController.swift
//  Loteria
//
//  Created by Alexandre Robaert on 10/03/21.
//

import UIKit

class LoteriaViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!
    @IBOutlet weak var btNewGame: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btNewGame.layer.cornerRadius = 10
    }

    @IBAction func generateGame() {
        
    }
}

