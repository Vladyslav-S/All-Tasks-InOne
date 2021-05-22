//
//  CustomTableViewCell.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 06.05.2021.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    
    // TODO outlets must be private
    @IBOutlet private weak var imageOfLesson: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    func setupCell(currentCell: LessonModel, cell: CustomTableViewCell) -> CustomTableViewCell {
        
        cell.accessoryType = .disclosureIndicator //strelochka v pravo ->
        cell.imageOfLesson.image = currentCell.imageData
        cell.nameLabel.text = currentCell.name
        cell.typeLabel.text = currentCell.type
        
        return cell
    }
    
}
