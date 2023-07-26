//
//  KeynoteViewController.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import UIKit

class KeynoteViewController: UIViewController {

    private var keynoteView : KeynoteView?
    private var slideManager : SlideManager
    
    
    
    init(slideManager: SlideManager) {
        self.slideManager = slideManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        slideManager = SlideManager(componentFactory: SlideComponentFactory(),
                                        slideFactory: SlideFactory(),
                                        slideCollection: SlideCollection())
        super.init(coder: coder)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        keynoteView?.slideDataSource = self
        addObservers()
        loadInitialKeynoteState()
        
        
    }
    

    
    private func layout(){
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

    
    private func loadInitialKeynoteState(){
        slideManager.addSlide()
        slideManager.addElement(length: 200, backgroundColor: .init(red: 200, green: 200, blue: 200), type: RectangleElement.self)
        keynoteView?.reloadSlide()
    }
    
   
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateComponentAlpha(_:)),
            name: NotificationName.transparencyChanged.notification ,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateComponentBackgroundColor(_:)),
            name: NotificationName.backgroundColorChanged.notification ,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateSelectedElement(_:)),
            name: NotificationName.changeSelectedElementId.notification ,
            object: nil
        )
    }
    
    
    @objc func updateComponentAlpha(_ notification: Notification) {
        if let alpha = notification.object as? AlphaLevel {
            slideManager.updateElementAlpha(alpha: alpha)
        }
    }
    
    @objc func updateComponentBackgroundColor(_ notification: Notification) {
        if let rgbColor = notification.object as? SlideRGBColor {
            slideManager.updateElementBackgroundColor(rgbColor: rgbColor)
            keynoteView?.reloadSlide()
            
        }
    }
    
    @objc func updateSelectedElement(_ notification: Notification) {
        
        if let id = notification.object as? String {
            slideManager.updateSelectedElement(id: id)
            keynoteView?.reloadSlide()
            
        }
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
