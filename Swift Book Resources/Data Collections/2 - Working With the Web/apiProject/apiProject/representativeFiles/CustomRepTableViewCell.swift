//
//  CustomRepTableViewCell.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/17/21.
//

import UIKit

class CustomRepTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(repInfo: RepInfo) {
        nameLabel.text = repInfo.name
        partyLabel.text = repInfo.party
        linkLabel.text = "Link: \(repInfo.link)"
    }

}
