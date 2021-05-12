//
//  ViewController.swift
//  pProjectAllTasks
//
//  Created by MACsimus on 21.04.2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //add cell reg
    }
    
    var data2 = RichViewController()
    var data3 = PoorViewController()
    var data4 = DiceViewController()
    var data5 = MagicBallViewController()
    var data6 = CalculatorViewController()
    var data7 = XylophoneViewController()
    var data8 = EggTimerViewController()
    var data9 = QuizzlerViewController()
    var data10 = DestinyViewController()
    var data11 = BMICalculateViewController()
    var data12 = TipsyCalculatorViewController()
    var data13 = WeatherViewController()
    var data14 = ByteCoinViewController()
    //var data15 =
    
    func getCells() -> [LessonModel] {
        return [data2.richModel, data3.poorModel, data4.diceModel, data5.magicBallModel, data6.calculatorModel, data7.xylophoneModel,     data8.eggTimerModel, data9.quizzlerModel, data10.destinyModel, data11.bmiCalculatorModel, data12.tipsyModel, data13.weatherModel, data14.byteCoinModel]
    }
//    let allCellData = getCells()
    
    
    //MARK:- Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let data = getCells()
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = getCells()
        let currentCell = data[indexPath.row]
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! CustomTableViewCell
        cell.accessoryType = .disclosureIndicator //strelochka v pravo ->
        
        //refactor
        cell.imageOfLesson.image = currentCell.imageData
        cell.nameLabel.text = currentCell.name
        cell.typeLabel.text = currentCell.type
        //
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = getCells()
        let currentCell = data[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: currentCell.storyboardName, bundle: nil)
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: currentCell.withIdentifire)
        newVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(newVC, animated: true)
    }
}


// Master branch

