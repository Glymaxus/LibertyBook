//
//  Double.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 06/04/2023.
//

import Foundation

extension Double {
    private var floatFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toString() -> String {
        return floatFormatter.string(for: self) ?? ""
    }
}
