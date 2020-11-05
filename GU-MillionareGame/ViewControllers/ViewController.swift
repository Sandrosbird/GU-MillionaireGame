//
//  ViewController.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 28.10.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionOrderControl: UISegmentedControl!
    
    private var selectedOrder: Order {
        switch self.questionOrderControl.selectedSegmentIndex {
        case 0:
            return .direct
        case 1:
            return .random
        default:
            return .direct
        }
    }
    //    weak var result: GameSession?
    @IBAction func didTapStartGame(_ sender: UIButton) {
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGame":
            if let destination = segue.destination as? GameViewController {
                destination.gameViewControllerDelegate = self
                destination.order = selectedOrder
            }
        default:
            break
        }
    }
    
    weak var viewControllerDelegate: GameViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
//        let gameViewController = GameViewController()
//        gameViewController.gameViewControllerDelegate? = self
        
        // Do any additional setup after loading the view.
    }
}


