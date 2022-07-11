//
//  Models.swift
//  MVP Setting Screen
//
//  Created by temp user on 11.07.2022.
//

import Foundation
import UIKit

struct StaticOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
}

struct Section {
    let opitions: [StaticOption]
}

var models = [Section]()

struct Metrics {
    
}

