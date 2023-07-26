//
//  NotificationName.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/26.
//

import Foundation
enum NotificationName: String {
    case backgroundColorChanged
    case transparencyChanged
    case changeSelectedElementId
    
    var notification: Notification.Name {
        return Notification.Name(self.rawValue)
    }
}
