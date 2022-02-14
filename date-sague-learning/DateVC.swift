//
//  ViewController.swift
//  date-sague-learning
//
//  Created by Дарья Тимофеева on 08.02.2022.
//

import UIKit

var weekday: String = ""

class DateVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var nameAndWeekdayFirstVC: UILabel!
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        let calendar = Calendar.current
        
        // получаем день рождения из datepicker
        let birthday = sender.date
        //получаем компоненты даты рождеения
        let birthdayComponents = Calendar.current.dateComponents(in: .current, from: birthday)
        //объявляем переменные, которые хранят день и месяц рождения
        guard let birthdayDay = birthdayComponents.day else { return }
        guard let birthdayMonth = birthdayComponents.month else { return }
        //получаем текущую дату и ее компоненты
        let currentDate = NSDate()
        let currentDateComponents = Calendar.current.dateComponents(in: .current, from: currentDate as Date)
        //объявляем переменную, хранящую текущий год
        guard let currentYear = currentDateComponents.year else { return }
        //получаем требуемую дату через компоненты
        let thisYearBdayComponents = DateComponents(calendar: calendar, year: currentYear, month: birthdayMonth, day: birthdayDay)
        //вызываем dateformatter
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_En")
        dateFormatter.dateFormat = "EEEE"
        //преобразуем компоненты в дату
        guard let date = calendar.date(from: thisYearBdayComponents) else { return }
        //получаем день недели нужной даты в формате строки
        weekday = dateFormatter.string(from: date)

    }
    

    @IBAction func findWeekdayBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toWeekdayVC", sender: nil)
    }
    
    @IBAction func unwindSegueToDateVC(segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? WeekdayVC else { return }
        guard let nameFromWeekdayVC = sourceVC.nameFromWeekdayVC, let weekdayFromWeekdayVC = sourceVC.weekdayFromWeekdayVC else { return }
        self.nameAndWeekdayFirstVC.text = "You found out \(nameFromWeekdayVC) celebrates their birthday on \(weekdayFromWeekdayVC) this year. You can repeat for another person."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? WeekdayVC else  { return }
        dvc.nameFromWeekdayVC =  nameTF.text
        dvc.weekdayFromWeekdayVC  = weekday
    }
    
    //убрать клавиатуру после окончания ввода текста
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

