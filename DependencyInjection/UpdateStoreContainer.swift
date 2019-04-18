import UIKit
import Auth
import Store
import B

struct UpdateStoreContainer {
    let parent: SignInContainer
    let store: Store
    
    init(parent: SignInContainer, session: Session) {
        self.parent = parent
        self.store = DefaultStore(session: session)
    }
    
    func updateStoreViewController() -> UIViewController {
        return UpdateStoreViewController(store: store, storeUpdateDoneVCFactory: self)
    }
}

extension UpdateStoreContainer: StoreUpdateDoneVCFactory {
    func viewController() -> UIViewController {
        return InfoContainer(parent: self).infoViewController()
    }
}
