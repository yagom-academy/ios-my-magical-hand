import UIKit

class ViewController: UIViewController {
    // MARK: UI Components
    private let blurBackgroundView: UIVisualEffectView = {
        let blurBackgroundView = UIVisualEffectView()
        blurBackgroundView.effect = UIBlurEffect(style: .dark)
        return blurBackgroundView
    }()
    private let drawingView: UIView = {
        let drawingView = UIView()
        drawingView.backgroundColor = .white
        return drawingView
    }()
    private let labelStackView: UIStackView = {
        let labelStackView = UIStackView()
        labelStackView.axis = .horizontal
        labelStackView.distribution = .equalSpacing
        return labelStackView
    }()
    private let showingResultButton: UIButton = {
        let showingResultButton = UIButton(type: .system)
        showingResultButton.setTitle("결과보기", for: .normal)
        showingResultButton.setTitleColor(.systemOrange, for: .normal)
        return showingResultButton
    }()
    private let removalButton: UIButton = {
        let removalButton = UIButton(type: .system)
        removalButton.setTitle("지우기", for: .normal)
        removalButton.setTitleColor(.systemGray2, for: .normal)
        return removalButton
    }()

    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
}

// MARK:- Extensions
extension ViewController {
    private func setConstraints() {
        view.addSubview(blurBackgroundView)
        view.addSubview(drawingView)
        view.addSubview(labelStackView)
        labelStackView.addArrangedSubview(showingResultButton)
        labelStackView.addArrangedSubview(removalButton)

        blurBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        drawingView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        showingResultButton.translatesAutoresizingMaskIntoConstraints = false
        removalButton.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            blurBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            blurBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            blurBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            blurBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            drawingView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            drawingView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            drawingView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            drawingView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            drawingView.heightAnchor.constraint(equalTo: drawingView.widthAnchor),

            labelStackView.topAnchor.constraint(equalTo: drawingView.bottomAnchor, constant: 24),
            labelStackView.leadingAnchor.constraint(equalTo: drawingView.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: drawingView.trailingAnchor),
            labelStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
