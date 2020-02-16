//
//  DateFormatter.swift
//  MovieGram
//
//  Created by zeyad on 2/16/20.
//  Copyright © 2020 zeyad. All rights reserved.
//

import Foundation
class DateFormatter {
    static let instance = DateFormatter()
    
    static func format(Date: String) -> String{
        instance.dateFormat = "yyyy:mm:dd"
        self.instance
        return ""
    }
}
