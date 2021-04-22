import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    private var shapeName: String = "동그라미"
    private var probability: String = "100.0"
    
    @IBOutlet weak var drawView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6
        resultLabel.isHidden = true
    }
    
    // MARK: - 결과보기 버튼 클릭 액션
    @IBAction func clickOnResult(_ sender: UIButton) {
        resultLabel.text = shapeName + "처럼 보이네요" + "\n" + probability + "%"
        resultLabel.isHidden = false
    }
    
    // MARK: - 지우기 버튼 클릭 액션
    @IBAction func clickOnRemove(_ sender: UIButton) {
        resultLabel.isHidden = true
    }
}

