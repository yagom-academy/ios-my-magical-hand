import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    private var shapeName: String = "동그라미"
    private var probability: String = "100.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6
        resultLabel.isHidden = true
    }
    
    @IBAction func clickOnResult(_ sender: UIButton) {
        resultLabel.text = shapeName + "처럼 보이네요" + "\n" + probability + "%"
        resultLabel.isHidden = false
    }
    
    @IBAction func clickOnRemove(_ sender: UIButton) {
        resultLabel.isHidden = true
    }
    
    
    
}

