//
//  ResultsTableViewCell.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 30.10.2020.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
