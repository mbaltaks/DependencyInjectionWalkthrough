import UIKit

extension UIViewController {
    public func addWatermark(text: String) {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 250)
        label.textColor = UIColor(white: 0.9, alpha: 1)
        label.text = text

        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    public func addTextField() -> UITextField {
        let field = UITextField()
        field.borderStyle = .roundedRect

        view.addSubview(field)

        field.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            field.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            field.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            field.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -56),
        ])

        return field
    }

    public func addButton(title: String, action: Selector) {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    public func addLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.textAlignment = .center

        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        return label
    }
}
