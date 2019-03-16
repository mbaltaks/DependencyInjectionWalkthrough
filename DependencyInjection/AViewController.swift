import UIKit

protocol BFactory {
    func makeB(session: Session) -> UIViewController
}

class AViewController: UIViewController {
    let authGateway: AuthGateway
    let bFactory: BFactory
    
    init(authGateway: AuthGateway, bFactory: BFactory) {
        self.authGateway = authGateway
        self.bFactory = bFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A"
        view.backgroundColor = .white
        addWatermark(text: "A")
        
        addButton(title: "Authenticate and go to B", action: #selector(goToB))
    }
    
    @objc func goToB() {
        let session = authGateway.authenticate()

        let b = bFactory.makeB(session: session)
        show(b, sender: self)
    }
}
