//
//  ViewController.swift
//  CalendarComponent
//
//  Created by Angelos Staboulis on 4/5/21.
//

import UIKit
protocol CalendarViewDelegate:AnyObject{
    func initHeaderView()
    func initializeCalendar()
    func highLightCurrentDay()
}
protocol CalendarDelegate:AnyObject{
    func moveCalendar()
    func goForward()
    func goBackward()
}
class ViewController: UIViewController,CalendarViewDelegate,CalendarDelegate {
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var numbers:[UILabel]=[]
    @IBOutlet var lblCalendar: UILabel!
    var positionDay:Int!=0
    var counterMonth:Int!=CalendarComponent.shared.getCurrentMonth()-1
    @IBAction func btnNext(_ sender: Any) {
        goForward()
    }
    @IBAction func btnPrevious(_ sender: Any) {
        goBackward()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highLightCurrentDay()
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController{
    func initHeaderView(){
        lblDate.text = CalendarComponent.shared.getCurrentMonthString() + " " + CalendarComponent.shared.getCurrentYearString()
        lblDate.textColor = .white
        lblDate.translatesAutoresizingMaskIntoConstraints = false
        lblCalendar.translatesAutoresizingMaskIntoConstraints = false
        lblDate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        lblCalendar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }
    func initializeCalendar(){
        for number in 0..<numbers.count {
            numbers[number].textColor = .white
            numbers[number].backgroundColor = .link
            
        }
    }
    func highLightCurrentDay(){
        for number in 0..<numbers.count {
            numbers[number].textColor = .white
            if numbers[number].text == String(CalendarComponent.shared.findCurrentDay()) {
                numbers[number].backgroundColor = .brown
            }
        }
        initHeaderView()
    }
}
extension ViewController{
    func moveCalendar(){
        if counterMonth == CalendarComponent.shared.getCurrentMonth()-1 {
            highLightCurrentDay()
        }
        else{
            initializeCalendar()
        }
        let result = 31-CalendarComponent.shared.findLastDayOfMonth(month: counterMonth)
        if result == 0 {
            for item in 28..<31{
                numbers[item].isHidden = false
            }
        }
        else if result > 1 {
            if (CalendarComponent.shared.findLastDayOfMonth(month: 2) == 28){
                for item in 28..<31{
                    numbers[item].isHidden = true
                }
            }
            else if (CalendarComponent.shared.findLastDayOfMonth(month: 2) == 29){
                for item in 29..<31{
                    numbers[item].isHidden = true
                }
            }
            else if (CalendarComponent.shared.findLastDayOfMonth(month: 2) == 30){
                numbers[30].isHidden = true
            }
        }
        else{
            for item in 28..<31{
                numbers[item].isHidden = false
            }
            numbers[30].isHidden = true
        }
    }
    func goForward() {
        if counterMonth == 12 {
            counterMonth = 1
        }
        else{
            counterMonth = counterMonth + 1
        }
        moveCalendar()
        lblDate.text = CalendarComponent.shared.getCurentMonth(month: counterMonth) + " " + CalendarComponent.shared.getCurrentYearString()
    }
    func goBackward() {
        if counterMonth == 1 {
            counterMonth = 12
        }
        else{
            counterMonth = counterMonth - 1
        }
        moveCalendar()
        lblDate.text = CalendarComponent.shared.getCurentMonth(month: counterMonth) + " " + CalendarComponent.shared.getCurrentYearString()
    }
}
