//
//  RightPanelView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation
import UIKit
class InspectorView : UIView{
    //배경색, 투명도 설정
    
    
    private var backgroundTitleLabel : UILabel?
    private var colorPickerButton : UIButton?
    private var opacityTitleLabel : UILabel?
    private var opacityNumberLabel : UILabel?
    private var opacityPlusButton : UIButton?
    private var opacityMinusButton : UIButton?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func layout(){
        
        backgroundTitleLabel = UILabel()
        colorPickerButton = UIButton()
        opacityTitleLabel = UILabel()
        opacityPlusButton = UIButton()
        opacityNumberLabel = UILabel()
        opacityPlusButton = UIButton()
        opacityMinusButton = UIButton()
        
        [backgroundTitleLabel,
         colorPickerButton,
         opacityTitleLabel,
         opacityNumberLabel,
         opacityPlusButton,
         opacityMinusButton].forEach{
            if let view = $0{
                self.addSubview(view)
            }
        }
        
        backgroundTitleLabel?.frame = .init(x: self.bounds.minX, y: self.bounds.minY, width: 80, height: 30)
        
        colorPickerButton?.frame = .init(x: self.bounds.minX + 10, y: self.bounds.minY + 10, width: self.bounds.width - 20, height: 30)
        
        guard let colorPickerButton = colorPickerButton else { return }
        opacityNumberLabel?.frame = .init(x: self.bounds.minX, y: colorPickerButton.bounds.minX + 10, width: self.bounds.width - 20, height: 30)
        
        
        
    }
    
    func attribute(){
        backgroundTitleLabel?.text = "배경색"
        colorPickerButton?.backgroundColor = .yellow
        opacityTitleLabel?.text = "투명도"
        opacityNumberLabel?.text = "0"
        
        
    }
    
}
