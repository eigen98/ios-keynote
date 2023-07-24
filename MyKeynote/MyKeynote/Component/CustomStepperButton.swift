//
//  CustomStepperButton.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
import UIKit

class CustomStepperButton : UIView{
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return button
    }()
    
    private let separator: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
    
    var valueChanged: ((Int) -> Void)?
    
    var value = 1{
        didSet {
            valueChanged?(value)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        attritubute()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
        attritubute()
    }
    
    func layout(){
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(separator)
        let buttonWidth: CGFloat = frame.width / 2
        let buttonHeight: CGFloat = frame.height
        
        minusButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight)
        plusButton.frame = CGRect(x: buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)
        separator.frame = CGRect(x: buttonWidth, y: 5.0, width: 1.0, height: buttonHeight - 10.0)
    }
    
    func attritubute(){
        self.backgroundColor = .gray
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc private func minusTapped() {
        if value > 1 { 
                value -= 1
            }
    }
    
    @objc private func plusTapped() {
        if value < 10 {
               value += 1
           }
    }
}
