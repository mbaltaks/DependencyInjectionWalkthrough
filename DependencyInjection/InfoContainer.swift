import UIKit
import C

struct InfoContainer {
    let parent: UpdateStoreContainer
    
    func infoViewController() -> UIViewController {
        return InfoViewController(infoDoneVCFactory: self)
    }
}

extension InfoContainer: InfoDoneVCFactory {
    func viewController() -> UIViewController {
        return DisplayStoreContainer(parent: self).displayStoreViewController()
    }
}
