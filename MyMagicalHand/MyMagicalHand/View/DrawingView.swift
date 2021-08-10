//
//  DrawingView.swift
//  MyMagicalHand
//
//  Created by 김찬우 on 2021/08/10.
//

import UIKit

class DrawingView: UIView {
    typealias ButtonAction = () -> Void

    let viewController: UIViewController
    let resultText: String?
    @objc var resultButtonAction: ButtonAction?
    @objc var deleteButtonAction: ButtonAction?

    init(viewController: UIViewController,
         resultText: String, deleteButtonAction: @escaping () -> Void,
         buttonAction: @escaping () -> Void) {
        self.viewController = viewController
        self.resultButtonAction = buttonAction
        self.deleteButtonAction = deleteButtonAction
        self.resultText = resultText
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()

    var canvasView: UIView = {
        let drawingView = UIView()
        drawingView.backgroundColor = .white
        drawingView.translatesAutoresizingMaskIntoConstraints = false
        return drawingView
    }()

    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    var resultButton: UIButton = {
        let button = UIButton()
        button.addTarget(DrawingViewController.self, action: #selector(getter: resultButtonAction), for: .touchUpInside)
        button.titleLabel?.textAlignment = .left
        return button
    }()

    var deleteButton: UIButton = {
        let button = UIButton()
        button.addTarget(DrawingViewController.self, action: #selector(getter: deleteButtonAction), for: .touchUpInside)
        button.titleLabel?.textAlignment = .right
        return button
    }()

    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "결과 화면"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    var percentageToMatch: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    func configure() {
        containerView.addArrangedSubview(canvasView)
        containerView.addArrangedSubview(labelStackView)
        containerView.addArrangedSubview(resultLabel)
        containerView.addArrangedSubview(percentageToMatch)

        labelStackView.addArrangedSubview(resultButton)
        labelStackView.addArrangedSubview(deleteButton)
    }

    func activate(resultButtonAction: @escaping ButtonAction, deleteButtonAction: @escaping ButtonAction) {
        self.resultButtonAction = resultButtonAction
        self.deleteButtonAction = deleteButtonAction
    }
}
