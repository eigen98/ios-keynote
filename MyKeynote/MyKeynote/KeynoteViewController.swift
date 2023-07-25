//
//  KeynoteViewController.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import UIKit

class KeynoteViewController: UIViewController {

    private var keynoteView : KeynoteView?
    var slideManager = SlideManager(componentFactory: SlideComponentFactory(),
                                    slideFactory: SlideFactory(),
                                    slideCollection: SlideCollection())
    
    
    
    init(slideManager: SlideManager) {
        self.slideManager = slideManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        slideManager = SlideManager(componentFactory: SlideComponentFactory(),
                                        slideFactory: SlideFactory(),
                                        slideCollection: SlideCollection())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        keynoteView?.slideDataSource = self
        attribute()
        loadInitialKeynoteState()
        
    }
    
    func layout(){
        keynoteView = KeynoteView()
        
        guard let keynoteView = keynoteView else { return }
        self.view.addSubview(keynoteView)
        keynoteView.translatesAutoresizingMaskIntoConstraints = false
        keynoteView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        keynoteView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        keynoteView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        keynoteView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        keynoteView.layout()
        keynoteView.attribute()
    }
    
    func attribute(){
        
    }
    
    func loadInitialKeynoteState(){
        slideManager.addSlide()
        slideManager.addElement(length: 200, backgroundColor: .init(red: 200, green: 200, blue: 200), type: RectangleElement.self)
        keynoteView?.reloadSlide()
    }
}

extension KeynoteViewController : SlideDataSource{
    func slide(at index: Int) -> SlideProtocol? {
        return slideManager.slideCollection[index]
    }
    
    func selectedSlide() -> SlideProtocol? {
        return slideManager.selectedSlide
    }
    
    func getSlideCount() -> Int {
        return slideManager.slideCount
    }
    
}
