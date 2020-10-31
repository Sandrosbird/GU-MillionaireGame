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
    
    //MARK: - Variables
    var game = Game.shared
    var resultsArray = Game.shared.getResults()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTableViewCell", for: indexPath) as! ResultsTableViewCell
        
        
        cell.title.text = "Счет: \(resultsArray[indexPath.row].score)"
        cell.subtitle.text = "Вопросов пройдено: \(resultsArray[indexPath.row].questionsPassed)"
        
//        cell?.textLabel?.text = "Счет: \(resultsArray[indexPath.row].score)"
//        cell?.textLabel?.attributedText = NSAttributedString(string: "Вопросов пройдено: \(resultsArray[indexPath.row].questionsPassed)")
        
        return cell
    }
}
