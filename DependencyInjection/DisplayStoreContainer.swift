import UIKit
import Store
import D

struct DisplayStoreContainer {
    let parent: InfoContainer
    
    func displayStoreViewController() -> UIViewController {
        let store = parent.parent.store
        return DisplayStoreViewController(store: store)
    }
}
