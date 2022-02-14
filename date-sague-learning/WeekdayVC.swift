//
//  WeekdayVC.swift
//  date-sague-learning
//
//  Created by Дарья Тимофеева on 08.02.2022.
//

import UIKit

class WeekdayVC: UIViewController {

    var nameFromWeekdayVC: String?
    var weekdayFromWeekdayVC: String?
    
    @IBOutlet weak var dateVCLabel: UILabel!
    
    @IBAction func backBtn(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name  = self.nameFromWeekdayVC  else { return  }
        guard let weekday  = self.weekdayFromWeekdayVC  else { return  }
        dateVCLabel.text = "\(name) celebrates their birthday on \(weekday) this year!"
    }
    
}
