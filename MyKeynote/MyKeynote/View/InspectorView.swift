//
//  RightPanelView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation
import UIKit
//우측 인스펙터 뷰



class InspectorView : UIView{
    
    private var backgroundTitleLabel : UILabel?
    private var colorPickerButton : UIButton?
    private var opacityTitleLabel : UILabel?
    private var opacityNumberLabel : UILabel?
    private var opacityButton : CustomStepperButton?
    
    var selectedComponent: BaseComponentView? {
        didSet {
            updateInspector()
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        attribute()
        configure()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        configure()
    }
    
    override func layoutSubviews() {
        
        attribute()
        configure()
    }
    
    
    func updateInspector() {
        guard let component = selectedComponent else {
            colorPickerButton?.backgroundColor = .white
            opacityNumberLabel?.text = ""
            colorPickerButton?.setTitle("", for: .normal)
            return
        }
        
        colorPickerButton?.backgroundColor = component.backgroundColor
        opacityNumberLabel?.text = String(format: "%.1f", component.alpha)
        colorPickerButton?.setTitle(component.backgroundColor?.rgbHex, for: .normal)
    }
    
    func layout(){
        
        backgroundTitleLabel = UILabel()
        colorPickerButton = UIButton()
        opacityTitleLabel = UILabel()
        opacityNumberLabel = UILabel()
        
        guard let backgroundTitleLabel = backgroundTitleLabel,
              let colorPickerButton = colorPickerButton,
              let opacityTitleLabel = opacityTitleLabel,
              let opacityNumberLabel = opacityNumberLabel else {
            return
        }
        
        
        [backgroundTitleLabel, colorPickerButton, opacityTitleLabel, opacityNumberLabel].forEach {
            self.addSubview($0)
        }
        
        backgroundTitleLabel.frame = .init(x: self.bounds.origin.x + 10,
                                           y: self.bounds.origin.y + 10,
                                           width: 80,
                                           height: 30)
        
        colorPickerButton.frame = .init(x: self.bounds.origin.x + 10,
                                        y: backgroundTitleLabel.frame.maxY + 20,
                                        width: 160,
                                        height: 30)
        
        opacityTitleLabel.frame = .init(x: self.bounds.origin.x + 10,
                                        y: colorPickerButton.frame.maxY + 20,
                                        width:  80,
                                        height: 30)
        
        opacityNumberLabel.frame = .init(x: self.bounds.origin.x  + 10,
                                         y: opacityTitleLabel.frame.maxY + 20,
                                         width: 50,
                                         height: 30)
        opacityButton = CustomStepperButton(frame: .init(x: opacityNumberLabel.frame.maxX  + 10,
                                                         y: opacityTitleLabel.frame.maxY + 20,
                                                         width: 100,
                                                         height: 30))
        addSubview(opacityButton!)
        
        
        
    }
    
    func attribute(){
        backgroundTitleLabel?.text = "배경색"
        colorPickerButton?.setTitleColor(.black, for: .normal)
        colorPickerButton?.backgroundColor = .yellow
        colorPickerButton?.layer.cornerRadius = 8
        
        opacityTitleLabel?.text = "투명도"
        opacityNumberLabel?.text = ""
        opacityNumberLabel?.backgroundColor = .white
        opacityNumberLabel?.textAlignment = .right
        
        
        
    }
    
    func configure(){
        
        colorPickerButton?.addTarget(self, action: #selector(colorPickerButtonTapped), for: .touchUpInside)
        
        opacityButton?.valueChanged = { [weak self] value in
            guard let level = AlphaLevel(rawValue: Float(value)),
                  let _ =  self?.selectedComponent else {
                return
            }
            NotificationCenter.default.post(name: NotificationName.transparencyChanged.notification, object: level)
            
            self?.opacityNumberLabel?.text = "\(level.rawValue)"
            self?.selectedComponent?.alpha = CGFloat(level.rawValue)
            self?.selectedComponent?.setNeedsDisplay()
            
        }
    }
    
    @objc private func colorPickerButtonTapped() {
        guard let component = selectedComponent else {
            return
        }
        
        let colorPickerController = UIColorPickerViewController()
        colorPickerController.selectedColor = component.backgroundColor ?? .clear
        colorPickerController.delegate = self
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        rootViewController.present(colorPickerController, animated: true, completion: nil)
    }
    
    
}

extension InspectorView: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        guard let component = selectedComponent else {
            return
        }
        
        let selectedColor = viewController.selectedColor
        component.backgroundColor = selectedColor
        NotificationCenter.default.post(name: NotificationName.backgroundColorChanged.notification, object: SlideRGBColor(color: selectedColor))
        colorPickerButton?.backgroundColor = selectedColor
        colorPickerButton?.setTitle(selectedColor.rgbHex, for: .normal)
        colorPickerButton?.setTitleColor(.black, for: .normal)
    }
}
