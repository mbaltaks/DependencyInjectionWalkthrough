import UIKit
import Store
import BaseUI

public protocol StoreUpdateDoneVCFactory {
    func viewController() -> UIViewController
}

public class UpdateStoreViewController: UIViewController {
    private var field: UITextField!
    private let store: Store
    private let storeUpdateDoneVCFactory: StoreUpdateDoneVCFactory
    
    public init(store: Store, storeUpdateDoneVCFactory: StoreUpdateDoneVCFactory) {
        self.store = store
        self.storeUpdateDoneVCFactory = storeUpdateDoneVCFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Store Data"
        view.backgroundColor = .white
        addWatermark(text: "B")
        
        field = addTextField()
        addButton(title: "Save state and go to next", action: #selector(handleStoreUpdateDone))
    }
    
    @objc func handleStoreUpdateDone() {
        store.save(state: field.text ?? "")
        
        let vc = storeUpdateDoneVCFactory.viewController()
        show(vc, sender: self)
    }
}
