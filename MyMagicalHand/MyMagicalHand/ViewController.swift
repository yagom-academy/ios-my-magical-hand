import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    private var shapeName: String = "동그라미"
    private var probability: Double = 100.0
    
    @IBOutlet weak var drawView: UIImageView!
    private var beforePoint: CGPoint!
    private var afterPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6
        resultLabel.isHidden = true
    }
    
    // MARK: - 결과보기 버튼 클릭 액션
    @IBAction func clickOnResult(_ sender: UIButton) {
        resultLabel.text = "\(shapeName)처럼 보이네요 \n \(probability)%"
        resultLabel.isHidden = false
    }
    
    // MARK: - 지우기 버튼 클릭 액션
    @IBAction func clickOnRemove(_ sender: UIButton) {
        resultLabel.isHidden = true
        drawView.image = nil
    }
    
    // MARK: - 터치 발생
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        beforePoint = (touches.first! as UITouch).location(in: drawView)
    }
    
    // MARK: - 그리기
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(drawView.frame.size)
        super.touchesMoved(touches, with: event)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        configureContext(context)

        afterPoint = (touches.first! as UITouch).location(in: drawView)

        drawView.image?.draw(in: CGRect(x: 0, y: 0, width: drawView.frame.size.width, height: drawView.frame.size.height))

        context.move(to: CGPoint(x: beforePoint.x, y: beforePoint.y))
        context.addLine(to: CGPoint(x: afterPoint.x, y: afterPoint.y))
        context.strokePath()

        drawView.image = UIGraphicsGetImageFromCurrentImageContext()
        beforePoint = afterPoint
        
        UIGraphicsEndImageContext()
    }
    
    // MARK: - 컨텍스트 설정
    private func configureContext(_ context: CGContext) {
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineCap(CGLineCap.round)
        context.setLineWidth(10.0)
    }
}
