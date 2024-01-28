//
//  Color+Extension.swift
//  VIPER-MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit


extension UIColor {
    static let showInfoBGColor = UIColor(hex: "#F3F2F7")
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension GenreEnum {
    var color: UIColor {
        switch self {
        case .action:
            return UIColor(hex: "#2566f3")
        case .adventure:
            return UIColor(hex: "#27d7f8")
        case .anime:
            return UIColor(hex: "#f8d327")
        case .comedy:
            return UIColor(hex: "#a1c866")
        case .crime:
            return UIColor(hex: "#27c075")
        case .drama:
            return UIColor(hex: "#4B0082")
        case .family:
            return UIColor(hex: "#EE82EE")
        case .fantasy:
            return UIColor(hex: "#FF00FF")
        case .history:
            return UIColor(hex: "#800080")
        case .horror:
            return UIColor(hex: "#FFC0CB")
        case .music:
            return UIColor(hex: "#FFA07A")
        case .mystery:
            return UIColor(hex: "#FF4500")
        case .romance:
            return UIColor(hex: "#FFD700")
        case .scienceFiction:
            return UIColor(hex: "#FF1493")
        case .thriller:
            return UIColor(hex: "#FF69B4")
        case .war:
            return UIColor(hex: "#C0C0C0")
        case .western:
            return UIColor(hex: "#808080")
        case .espionage:
            return UIColor(hex: "#2c9724")
        case .legal:
            return UIColor(hex: "#bb24b3")
        case .medical:
            return UIColor(hex: "#d6b4e4")
        case .sports:
            return UIColor(hex: "#0c7211")
        case .supernatural:
            return UIColor(hex: "#bdacc6")
        }
    }
}
