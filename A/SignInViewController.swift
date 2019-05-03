import Auth
import BaseUI
import UIKit

public protocol SignInSuccessVCFactory {
    func viewController(session: Session) -> UIViewController
}

public class SignInViewController: UIViewController {
    let authGateway: AuthGateway
    let signInSuccessVCFactory: SignInSuccessVCFactory

    public init(authGateway: AuthGateway, signInSuccessVCFactory: SignInSuccessVCFactory) {
        self.authGateway = authGateway
        self.signInSuccessVCFactory = signInSuccessVCFactory
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign In"
        view.backgroundColor = .white
        addWatermark(text: "A")

        addButton(title: "Authenticate -> success screen", action: #selector(signInSuccessful))
    }

    @objc func signInSuccessful() {
        let session = authGateway.authenticate()

        let vc = signInSuccessVCFactory.viewController(session: session)
        show(vc, sender: self)
    }
}
