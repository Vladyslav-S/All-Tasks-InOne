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
    var cellModels: [LessonModel] { // change to computing property / var cells: [LessonModel] {}
            return [RichViewController.cellModel,
                    PoorViewController.cellModel,
                    DiceViewController.cellModel,
                    MagicBallViewController.cellModel,
                    CalculatorViewController.cellModel,
                    XylophoneViewController.cellModel,
                    EggTimerViewController.cellModel,
                    QuizzlerViewController.cellModel,
                    DestinyViewController.cellModel,
                    BMICalculateViewController.cellModel,
                    TipsyCalculatorViewController.cellModel,
                    WeatherViewController.cellModel,
                    ByteCoinViewController.cellModel,
                    WelcomeViewController.cellModel]
    }
    
    //MARK:- Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! CustomTableViewCell // ref
        cell.setup(with: cellModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCellModel = cellModels[indexPath.row]
                
        presentViewController(with: selectedCellModel)
    }

    func presentViewController(with model: LessonModel) {
        let storyBoard = UIStoryboard(name: model.storyboardName, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: model.withIdentifire)
        controller.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(controller, animated: true)
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



