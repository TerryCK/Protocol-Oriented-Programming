import UIKit

//enum MyContain {
//
//    case before
//    case after
//    case between
//
//}
//
//class MyState {
//
//    static private var instance:MyState?
//
//    private var contains:[(min:Int,max:Int,string:String,contain:MyContain)] = [
//        (min:0,max:0,string:"zero",contain:.between),
//        (min:0,max:10,string:"one",contain:.after),
//        (min:11,max:20,string:"two",contain:.between),
//        (min:21,max:30,string:"three",contain:.between),
//        (min:31,max:40,string:"four",contain:.between),
//        (min:41,max:50,string:"five",contain:.before),
//        (min:50,max:Int.max,string:"Limit",contain:.between)
//    ]
//
//    static func shared() -> MyState {
//        if instance == nil {
//            instance = MyState()
//        }
//        return instance!
//    }
//
//    func state(_ value:Int) -> String?{
//        for item in contains {
//            if self._getString(value: value, min: item.min, max: item.max, contain: item.contain) {
//                return item.string
//            }
//        }
//        return nil
//    }
//
//    private func _getString(value:Int,min:Int,max:Int,contain:MyContain) -> Bool{
//        switch contain {
//
//        case .before:
//            return value >= min && value < max
//
//        case .after:
//            return value > min && value <= max
//
//        case .between:
//            return value >= min && value <= max
//        }
//
//    }
//
//}
//
//let str = MyState.shared().state(31)

import Foundation

protocol BatteryStatusProtocol {
    static var allStatus: [BatteryStatus] { get }
    mutating func setStatus<T: BinaryInteger>(input: T)
}
enum BatteryStatus: String, BatteryStatusProtocol {
    case full, medium, less, charging, notOffcial
}
// Implement
extension BatteryStatus {
    static var allStatus: [BatteryStatus] {
        return [full, medium, less, charging, notOffcial]
    }
    static let shared: BatteryStatus = .full
    mutating func setStatus<T: BinaryInteger>(input: T) {
        switch input {
        case 0...30:    self = .less
        case 31...90:   self = .medium
        case 90...100:  self = .full
        default:        self = .notOffcial
        }
    }
}
// Usage
var batteryStatus = BatteryStatus.shared
batteryStatus.setStatus(input: 50)
batteryStatus.rawValue
batteryStatus.setStatus(input: 10)
batteryStatus.setStatus(input: -1)




