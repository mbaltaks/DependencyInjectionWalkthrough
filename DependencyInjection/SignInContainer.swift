import UIKit
import Auth
import A

struct SignInContainer {
    let authGateway = DefaultAuthGateway()
    
    func signInViewController() -> UIViewController {
        let vc = SignInViewController(authGateway: authGateway, signInSuccessVCFactory: self)
        return UINavigationController(rootViewController: vc)
    }
}

extension SignInContainer: SignInSuccessVCFactory {
    func viewController(session: Session) -> UIViewController {
        return UpdateStoreContainer(parent: self, session: session).updateStoreViewController()
    }
}
