//
//  KeynoteView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation
import UIKit
class KeynoteView : UIView{
    
    private var slideListContainerView : SlideListView?
    private var presentationView : PresentationView?
    private var inspectorView : InspectorView?
    var slideDataSource : SlideDataSource?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        attribute()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
    }
    
    func allAddSubViews(){
        slideListContainerView =  SlideListView()
        presentationView = PresentationView()
        inspectorView =  InspectorView()
        
        [slideListContainerView, presentationView, inspectorView]
            .forEach{ container in
                if let container{
                    self.addSubview(container)
                    container.translatesAutoresizingMaskIntoConstraints = false
                }
            }
    }
    
    func layout(){
        allAddSubViews()
        layoutSlideListView()
        layoutInspectorView()
        layoutPresentationView()
        
    }
    
    
    func attribute(){
        self.backgroundColor = .gray
        slideListContainerView?.backgroundColor = .lightGray
        presentationView?.backgroundColor = .white
        inspectorView?.backgroundColor = .lightGray
        
        
    }
    
   
    
    
    func reloadSlide() {
        
        guard let dataSource = slideDataSource,
            let slide = dataSource.selectedSlide() else { return }
        
        for component in slide.elements.elementArray {
            presentationView?.updateComponent(component)
        }
       
    }
    
    func resetSlide() {
        for subview in presentationView?.subviews ?? [] {
            subview.removeFromSuperview()
        }
        presentationView?.resetPresentation()
        
    }
    
    func addComponentsForSlide(_ slide: SlideProtocol) {
        for component in slide.elements.elementArray {
            presentationView?.updateComponent(component)
        }
    }

    func addComponent(_ component: SlideElementProtocol) {
        presentationView?.updateComponent(component)
    }
    
    

    
    func layoutSlideListView(){
        guard let container = slideListContainerView else{
            return
        }
        
        self.addSubview(container)
        container.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        
    }
    
    func layoutPresentationView(){
        guard let container = presentationView else{
            return
        }
        self.addSubview(container)
        
        if let slideListTrailing = slideListContainerView?.safeAreaLayoutGuide.trailingAnchor {
            container.leadingAnchor.constraint(equalTo: slideListTrailing).isActive = true
        }
        if let controllerLeading = inspectorView?.safeAreaLayoutGuide.leadingAnchor {
            container.trailingAnchor.constraint(equalTo: controllerLeading).isActive = true
        }
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 3 / 4).isActive = true
        container.delegate = self
        
        
    }
    
    func layoutInspectorView(){
        guard let view = inspectorView else{
            return
        }
        
        self.addSubview(view)
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant: 180).isActive = true
        view.layout()
        view.attribute()
    }
}



extension KeynoteView : PresentationViewDelegate{
    func didSelectComponent(_ component: BaseComponentView?) {
        inspectorView?.selectedComponent = component
        if let selectedId = component?.id{
            NotificationCenter.default.post(name: NotificationName.changeSelectedElementId.notification, object: selectedId)
       
        }
        
    }
}

extension KeynoteView{
    func setSlideTableViewDataSource<T : UITableViewDataSource>(dataSource : T){
        slideListContainerView?.setTableViewDataSource(dataSource: dataSource)
    }
    
    func setSlideTableViewDelegate<T : UITableViewDelegate>(delegate : T){
        slideListContainerView?.setTableViewDelegate(delegate: delegate)
    }
    
    func setSlideListDelegate<T : SlideListViewDelegate>(delegate : T){
        slideListContainerView?.setSlideListDelegate(delegator: delegate)
    }
    
    func setSlideTableViewDragDelegate<T : UITableViewDragDelegate>(delegate : T){
        slideListContainerView?.setTableViewDragDelegate(delegator: delegate)
    }
    
    func setSlideTableViewDropDelegate<T : UITableViewDropDelegate>(delegate : T){
        slideListContainerView?.setTableViewDropDelegate(delegator: delegate)
    }
}

