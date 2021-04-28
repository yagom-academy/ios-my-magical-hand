import UIKit

class ResultLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    init(font: UIFont) {
        super.init(frame: .zero)
        configure()
        self.font = font
    }
    
    private func configure() {
        textAlignment = .center
        textColor = .label
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
