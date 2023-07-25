//
//  PresentationView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
import UIKit
//슬라이드가 표시되는 뷰
protocol PresentationViewDelegate: AnyObject {
    func didSelectComponent(_ component: RectangleComponentView?)
}

class PresentationView : UIView{
    
    weak var delegate: PresentationViewDelegate?
    
    private var componentViews: [String: RectangleComponentView] = [:]
       
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: self)
        
        let hitViews = self.subviews.filter { $0.frame.contains(location) }
        
        if let selectedView = hitViews.last as? RectangleComponentView {
            selectedView.select()
            delegate?.didSelectComponent(selectedView)
        } else {
            for subview in self.subviews {
                (subview as? RectangleComponentView)?.deselect()
                delegate?.didSelectComponent(nil)
            }
        }
    }
    
    func updateComponent(_ component: SlideElementProtocol) {
        
        if let existingComponentView = componentViews[component.id] {
            
            let size = component.size
            
            existingComponentView.frame = .init(x: 320,
                                                y: 235,
                                                width: size.width,
                                                height: size.height)
        } else {
            let subView = RectangleComponentView()
            self.addSubview(subView)
            let size = component.size
            subView.configure(with: component)
            subView.frame = .init(x: 320, y: 235, width: size.width, height: size.height)
            
            componentViews[component.id] = subView
        }
     
    }
    
    func deleteComponent(_ component: SlideElementProtocol){
        guard let componentView = componentViews[component.id] else {
               return
           }
           componentView.removeFromSuperview()

           componentViews.removeValue(forKey: component.id)
    }
    
    
    
}
