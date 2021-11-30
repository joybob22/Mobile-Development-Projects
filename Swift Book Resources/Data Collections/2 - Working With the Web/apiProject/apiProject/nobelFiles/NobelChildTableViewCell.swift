//
//  NobelChildTableViewCell.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import UIKit

class NobelChildTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(nobelWinner: NobelTableData) {
        nameLabel.text = nobelWinner.label
    }

}
