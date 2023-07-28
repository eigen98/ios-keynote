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
        keynoteView.setSlideTableViewDataSource(dataSource: self)
        keynoteView.setSlideTableViewDelegate(delegate: self)
        keynoteView.setSlideListDelegate(delegate: self)
        keynoteView.setSlideTableViewDropDelegate(delegate: self)
        keynoteView.setSlideTableViewDragDelegate(delegate: self)
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

extension KeynoteViewController : UITableViewDataSource , UITableViewDelegate{
    
    enum CellSize{
        static let CELL_HEIGHT = 100.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slideManager.slideCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else{
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.label.text = "\(indexPath.row + 1)"
        cell.imageViewRight.image = UIImage(named: "slide_cell_img")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellSize.CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let currentSelectedSlide = slideManager.selectedSlide,
            currentSelectedSlide.id == slideManager.slideCollection[indexPath.row]?.id {
            tableView.deselectRow(at: indexPath, animated: true)
            slideManager.selectedSlide = nil
        } else {
            slideManager.selectedSlide = slideManager.slideCollection[indexPath.row]
            keynoteView?.resetSlide()
            keynoteView?.reloadSlide()
        }
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        slideManager.moveSlide(from: sourceIndexPath.row, to: destinationIndexPath.row)
        keynoteView?.resetSlide()
        keynoteView?.reloadSlide()
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

extension KeynoteViewController : SlideListViewDelegate{
    func addSlideButtonTapped() {
        slideManager.addSlide()
        slideManager.addRandomElement()
        keynoteView?.resetSlide()
        keynoteView?.reloadSlide()
       
    }
    
}

extension KeynoteViewController : UITableViewDragDelegate{
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}

extension KeynoteViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        
        if session.localDragSession != nil {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) { }
}

