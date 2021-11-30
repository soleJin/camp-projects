//
//  Date+ConverToString.swift
//  ProjectManager
//
//  Created by sole on 2021/03/09.
//

import Foundation

extension Date {
    var dayToString: String {
        let currentLocale = Locale.current.collatorIdentifier ?? "ko_KR"
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: currentLocale)
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy. MM. dd.")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter.string(from: self)
    }
    
    var timeToString: String {
            let currentLocale = Locale.current.collatorIdentifier ?? "en_US"
            let dateFormatter = DateFormatter()
            
            dateFormatter.locale = Locale(identifier: currentLocale)
            dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy h:mm:ss a")
            dateFormatter.timeZone = TimeZone.autoupdatingCurrent
            return dateFormatter.string(from: self)
        }
}
