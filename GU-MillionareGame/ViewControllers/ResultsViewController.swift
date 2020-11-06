//
//  ResultsViewController.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 29.10.2020.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBAction func deleteResults(_ sender: UIBarButtonItem) {
        GameSessionCaretaker().deleteAll(records: resultsArray)
        tableView.reloadData()
    }
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Variables
//    var result: GameSession!
    var resultsArray = Game.shared.getResults()
    weak var delegate: GameViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTableViewCell", for: indexPath) as! ResultsTableViewCell
        cell.title.text = "Счет: \(resultsArray[indexPath.row].score)"
        cell.subtitle.text = "Вопросов: пройдено \(resultsArray[indexPath.row].questionsPassed); всего: \(resultsArray[indexPath.row].questionsCount) "
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
