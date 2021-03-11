//
//  LoteriaViewController.swift
//  Loteria
//
//  Created by Alexandre Robaert on 10/03/21.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

class LoteriaViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!
    @IBOutlet weak var btNewGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btNewGame.layer.cornerRadius = 10
        showNumbersAndTitle(for: .megasena)
    }
    
    func generateNumbers(amountGame: UInt8, numberLimit: UInt8) -> [UInt8] {
        var numberSorted: [UInt8] = []
        while numberSorted.count < amountGame {
            let number = UInt8.random(in: 1...numberLimit)
            if !numberSorted.contains(number) {
                numberSorted.append(number)
            }
        }
        return numberSorted.sorted()
    }
    
    func showNumbersAndTitle(for type: GameType){
        
        lbGameType.text = type.rawValue
        balls.last?.isHidden = type == GameType.megasena ? false : true
        
        var numbers: [UInt8] = []
        
        switch type {
            case .megasena:
                numbers = generateNumbers(amountGame: 6, numberLimit: 60)
            case .quina:
                numbers = generateNumbers(amountGame: 5, numberLimit: 100)
        }
        for (index, number) in numbers.enumerated() {
            balls[index].setTitle(String(number), for: .normal)
        }
    }

    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
            case 0:
                showNumbersAndTitle(for: .megasena)
            default:
                showNumbersAndTitle(for: .quina)
        }
    }
}

