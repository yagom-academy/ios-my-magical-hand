import UIKit

class ActionButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    init(title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        configure()
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
