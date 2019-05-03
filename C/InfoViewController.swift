import BaseUI
import UIKit

public protocol InfoDoneVCFactory {
    func viewController() -> UIViewController
}

public class InfoViewController: UIViewController {
    private let infoDoneVCFactory: InfoDoneVCFactory

    public init(infoDoneVCFactory: InfoDoneVCFactory) {
        self.infoDoneVCFactory = infoDoneVCFactory
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Info"
        view.backgroundColor = .white
        addWatermark(text: "C")

        addButton(title: "Go to next", action: #selector(handleInfoDone))
    }

    @objc func handleInfoDone() {
        let vc = infoDoneVCFactory.viewController()
        show(vc, sender: self)
    }
}
