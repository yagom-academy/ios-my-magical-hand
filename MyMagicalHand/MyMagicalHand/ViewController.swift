import UIKit

class ViewController: UIViewController {
    //MARK: - Views
    private let backgroundView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView()
        visualEffectView.effect = UIBlurEffect(style: .dark)
        return visualEffectView
    }()
    private let canvasView = CanvasView()
    private let buttonHorizontalStackView = MagicalHandStackView(axis: .horizontal, distribution: .equalSpacing)
    private let showResultButton = ActionButton(title: "결과보기", titleColor: .systemYellow)
    private let clearButton = ActionButton(title: "지우기", titleColor: .white)
    private let labelVerticalStackView = MagicalHandStackView(axis: .vertical, distribution: .fillProportionally)
    private let looksLikeLabel = ResultLabel(font: UIFont.preferredFont(forTextStyle: .title2))
    private let percentLabel = ResultLabel(font: UIFont.preferredFont(forTextStyle: .body))

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureCanvasView()
        configureStackViews()
    }
    
    //MARK: - Configure Views
    private func configureBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.frame = view.bounds
    }
    private func configureCanvasView() {
        let padding: CGFloat = 16
        let width = view.frame.width - (padding * 2)

        view.addSubview(canvasView)
        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            canvasView.widthAnchor.constraint(equalToConstant: width),
            canvasView.heightAnchor.constraint(equalToConstant: width)
        ])
    }
    
    private func configureStackViews() {
        let padding: CGFloat = 16
        
        view.addSubview(buttonHorizontalStackView)
        view.addSubview(labelVerticalStackView)
        
        buttonHorizontalStackView.addArrangedSubview(showResultButton)
        buttonHorizontalStackView.addArrangedSubview(clearButton)
        labelVerticalStackView.addArrangedSubview(looksLikeLabel)
        labelVerticalStackView.addArrangedSubview(percentLabel)
        
        NSLayoutConstraint.activate([
            buttonHorizontalStackView.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: padding),
            buttonHorizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            buttonHorizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            buttonHorizontalStackView.heightAnchor.constraint(equalToConstant: 40),
            labelVerticalStackView.topAnchor.constraint(equalTo: buttonHorizontalStackView.bottomAnchor, constant: padding),
            labelVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            labelVerticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            labelVerticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
}

