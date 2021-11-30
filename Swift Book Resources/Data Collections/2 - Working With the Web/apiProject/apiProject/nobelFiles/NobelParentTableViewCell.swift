//
//  NobelParentTableViewCell.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import UIKit

class NobelParentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(nobelData: NobelTableData) {
        categoryLabel.text = nobelData.label
    }

}
