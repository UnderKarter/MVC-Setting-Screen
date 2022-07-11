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

struct SwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
    var isOn: Bool
}

struct Section {
    let opitions: [SettingOptionType]
}

enum SettingOptionType {
    case staticCell (model: StaticOption)
    case switchCell (model: SwitchOption)
}

var models = [Section]()

struct Metrics {
    
}

