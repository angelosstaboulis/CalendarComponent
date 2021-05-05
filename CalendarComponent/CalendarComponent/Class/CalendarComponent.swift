//
//  CalendarComponent.swift
//  CalendarComponent
//
//  Created by Angelos Staboulis on 5/5/21.
//

import Foundation
class CalendarComponent{
    var components = DateComponents()
    var format = DateFormatter()
    static let shared = CalendarComponent()
    private init(){}
    func findLastDayOfCurrentMonth()->Int{
        components.day = 0
        components.month = Calendar.current.component(.month, from: Date()) + 1
        components.year = Calendar.current.component(.year, from: Date())
        let convertedDate = Calendar.current.date(from: components)
        format = DateFormatter()
        format.dateStyle = .short
        format.defaultDate = convertedDate
        let dateArray = format.string(from: convertedDate!).components(separatedBy: "/")
        return Int(dateArray[1])!
    }
    func findLastDayOfMonth(month:Int)->Int{
        components.day = 0
        components.month = month + 1
        components.year = Calendar.current.component(.year, from: Date())
        let convertedDate = Calendar.current.date(from: components)
        format = DateFormatter()
        format.dateStyle = .short
        format.defaultDate = convertedDate
        let dateArray = format.string(from: convertedDate!).components(separatedBy: "/")
        return Int(dateArray[1])!
    }
    func getCurentMonth(month:Int)->String{
        components.day = 0
        components.month = month + 1
        components.year = Calendar.current.component(.year, from: Date())
        let convertedDate = Calendar.current.date(from: components)
        format = DateFormatter()
        format.dateStyle = .medium
        format.defaultDate = convertedDate
        let dateArray = format.string(from: convertedDate!).components(separatedBy: " ")
        return dateArray[0]
    }
    func findCurrentDay()->Int{
        components.day = Calendar.current.component(.day, from: Date())
        components.month = Calendar.current.component(.month, from: Date())
        components.year = Calendar.current.component(.year, from: Date())
        return components.day!
    }
    func getCurrentMonth()->Int{
        components.day = 0
        components.month = Calendar.current.component(.month, from: Date()) + 1
        components.year = Calendar.current.component(.year, from: Date())
        return components.month!
    }
    func getCurrentMonthString()->String{
        components.day = 0
        components.month = Calendar.current.component(.month, from: Date()) + 1
        components.year = Calendar.current.component(.year, from: Date())
        let convertedDate = Calendar.current.date(from: components)
        format = DateFormatter()
        format.dateStyle = .medium
        format.defaultDate = convertedDate
        let dateArray = format.string(from: convertedDate!).components(separatedBy: " ")
        return dateArray[0]
    }
    func getCurrentYearString()->String{
        components.day = 0
        components.month = Calendar.current.component(.month, from: Date()) + 1
        components.year = Calendar.current.component(.year, from: Date())
        let convertedDate = Calendar.current.date(from: components)
        format = DateFormatter()
        format.dateStyle = .medium
        format.defaultDate = convertedDate
        let dateArray = format.string(from: convertedDate!).components(separatedBy: " ")
        return dateArray[2]
    }
}
