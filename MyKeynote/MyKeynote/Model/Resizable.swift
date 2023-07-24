//
//  Resizable .swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/24.
//

import Foundation
//크기 조절
protocol Resizable {
    var size: CGSize { get set }

    func resize(to newSize: CGSize)
}
