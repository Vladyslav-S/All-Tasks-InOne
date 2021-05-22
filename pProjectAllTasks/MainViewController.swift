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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // Must do this in order to documentation
        navigationController?.navigationBar.barTintColor = UIColor(named: "Default")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //add cell reg
    }
    
    func getCells() -> [LessonModel] { // change to comp prop/ var cells: [LessonModel] {}
        
        var cells: [LessonModel] {
            
        }
//        var data2 = RichViewController()
//        var data3 = PoorViewController()
//        var data4 = DiceViewController()
//        var data5 = MagicBallViewController()
//        var data6 = CalculatorViewController()
//        var data7 = XylophoneViewController()
//        var data8 = EggTimerViewController()
//        var data9 = QuizzlerViewController()
//        var data10 = DestinyViewController()
//        var data11 = BMICalculateViewController()
//        var data12 = TipsyCalculatorViewController()
//        var data13 = WeatherViewController()
//        var data14 = ByteCoinViewController()
//        var data15 = WelcomeViewController()
        
        return [RichViewController.cellModel, PoorViewController.cellModel,DiceViewController.cellModel, MagicBallViewController.cellModel, CalculatorViewController.cellModel, XylophoneViewController.cellModel, EggTimerViewController.cellModel, QuizzlerViewController.cellModel, DestinyViewController.cellModel, BMICalculateViewController.cellModel, TipsyCalculatorViewController.cellModel, WeatherViewController.cellModel,ByteCoinViewController.cellModel, WelcomeViewController.cellModel]
        }
    
    //MARK:- Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let data = getCells()
        
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = getCells()
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! CustomTableViewCell
        return cell.setupCell(currentCell: data[indexPath.row], cell: cell )
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = getCells()
        
        let currentCell = data[indexPath.row]
        let storyBoard/*: UIStoryboard*/ = UIStoryboard(name: currentCell.storyboardName, bundle: nil)
        let newVC = storyBoard.instantiateViewController(withIdentifier: currentCell.withIdentifire)
        newVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(newVC, animated: true)
    }
}


extension UIViewController {
    func pop(numberOfTimes: Int) {
        guard let navigationController = navigationController else {
            return
        }
        let viewControllers = navigationController.viewControllers
        let index = numberOfTimes + 1
        if viewControllers.count >= index {
            navigationController.popToViewController(viewControllers[viewControllers.count - index], animated: true)
        }
    }
}


protocol ControllerIdentifiable: class { //must be class to make weak property  //  all protocols ending  - "able" дієприслівники
    
    static var cellModel: LessonModel { get }
    //get - only read
    //get/set - write
}



