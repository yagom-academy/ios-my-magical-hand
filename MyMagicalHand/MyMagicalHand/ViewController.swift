import UIKit

class ViewController: UIViewController {
    // MARK: UI Components
    private let blurBackgroundView: UIVisualEffectView = {
        let blurBackgroundView = UIVisualEffectView()
        blurBackgroundView.effect = UIBlurEffect(style: .dark)
        return blurBackgroundView
    }()
    private let canvasView: CanvasView = {
        let canvasView = CanvasView()
        canvasView.backgroundColor = .white
        return canvasView
    }()
    private let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        return buttonStackView
    }()
    private let showingResultButton: UIButton = {
        let showingResultButton = UIButton(type: .system)
        showingResultButton.setTitle("결과보기", for: .normal)
        showingResultButton.setTitleColor(.systemOrange, for: .normal)

        showingResultButton.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        return showingResultButton
    }()
    private let removalButton: UIButton = {
        let removalButton = UIButton(type: .system)
        removalButton.setTitle("지우기", for: .normal)
        removalButton.setTitleColor(.systemGray2, for: .normal)

        removalButton.addTarget(self, action: #selector(removeDrawing), for: .touchUpInside)
        return removalButton
    }()
    private let labelStackView: UIStackView = {
        let labelStackView = UIStackView()
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.spacing = 12
        labelStackView.distribution = .equalSpacing
        return labelStackView
    }()
    private let returnResultLabel: UILabel = {
        let returnResultLabel = UILabel()
        // TODO: Apply string interpolation
        returnResultLabel.text = "동그라미처럼 보이네요"
        returnResultLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        returnResultLabel.textColor = .systemGray6
        returnResultLabel.numberOfLines = 0
        return returnResultLabel
    }()
    private let similarProportionLabel: UILabel = {
        let similarProportionLabel = UILabel()
        // TODO: Apply string interpolation
        similarProportionLabel.text = "100.0%"
        similarProportionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        similarProportionLabel.textColor = .systemGray2
        similarProportionLabel.numberOfLines = 0
        return similarProportionLabel
    }()

    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
}

// MARK:- Extensions
extension ViewController {
    //MARK: Methods
    private func setConstraints() {
        view.addSubview(blurBackgroundView)
        view.addSubview(canvasView)
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(showingResultButton)
        buttonStackView.addArrangedSubview(removalButton)
        view.addSubview(labelStackView)
        labelStackView.addArrangedSubview(returnResultLabel)
        labelStackView.addArrangedSubview(similarProportionLabel)

        blurBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        showingResultButton.translatesAutoresizingMaskIntoConstraints = false
        removalButton.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        returnResultLabel.translatesAutoresizingMaskIntoConstraints = false
        similarProportionLabel.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            blurBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            blurBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            blurBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            blurBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            canvasView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            canvasView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            canvasView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            canvasView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            canvasView.heightAnchor.constraint(equalTo: canvasView.widthAnchor),

            buttonStackView.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 24),
            buttonStackView.leadingAnchor.constraint(equalTo: canvasView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: canvasView.trailingAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 30),

            labelStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 32),
            labelStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            labelStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: -100)
        ])
    }

    //MARK: Selectors
    @objc private func removeDrawing() {
        labelStackView.isHidden = true
    }

    @objc private func showResult() {
        labelStackView.isHidden = false
    }
}
