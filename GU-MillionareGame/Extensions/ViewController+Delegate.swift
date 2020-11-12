//
//  ViewController+Delegate.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 02.11.2020.
//

import UIKit

extension ViewController: GameViewControllerDelegate {
    func didEndGame(withResult result: GameSession) {
        viewControllerDelegate?.didEndGame(withResult: result)
        Game.shared.addToResults(results: result)
        dismiss(animated: true, completion: nil)
    }
}
