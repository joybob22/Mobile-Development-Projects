//
//  NobelTableData.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import Foundation

//This is the "merged" data type
//The thing that was common between both types of cells was that we needed a label.
//The only other thing I needed to know was if the cell is a parent(category)?
//If it is a parent(category) cell then is it selected? Meaning are its child cells visible?

struct NobelTableData {
    var label: String
    var isParent: Bool
    var isSelected: Bool
}
