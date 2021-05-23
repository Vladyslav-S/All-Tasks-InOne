//
//  CustomTableViewCell.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 06.05.2021.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imageOfLesson: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    func setup(with dataModel: LessonModel) {
        
        accessoryType = .disclosureIndicator //strelochka v pravo ->
        
        imageOfLesson.image = dataModel.imageData
        nameLabel.text = dataModel.name
        typeLabel.text = dataModel.type
    }
}
