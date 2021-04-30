import UIKit
import Vision

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    private var shapeName: String = "동그라미"
    private var probability: Double = 80.0
    
    @IBOutlet weak var drawView: UIImageView!
    private var beforePoint: CGPoint!
    private var afterPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6
        resultLabel.isHidden = true
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let configuration = MLModelConfiguration()
            let model = try VNCoreMLModel(for: ShapesClassifier(configuration: configuration).model)
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    // MARK: - 결과보기 버튼 클릭 액션
    @IBAction func clickOnResult(_ sender: UIButton) {
        updateClassifications(for: drawView.image!)
        
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

// MARK: - 코어 모델 연동 및 예측
extension ViewController {
    // MARK: - 모델 예측
    private func updateClassifications(for image: UIImage) {
        guard let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue)) else {
            return
        }
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create \(CIImage.self) from \(image).")
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    //MARK: - 예측 결과
    private func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results,
                  let classifications = results as? [VNClassificationObservation] else {
                return
            }
            let topClassifications = classifications.prefix(2)
            let descriptions = topClassifications.map { classification in
                return (classification.confidence, classification.identifier)
            }
            
            guard let identifier = descriptions.first?.1, let confidence = descriptions.first?.0 else {
                return
            }
            
            self.shapeName = identifier
            self.probability = Double(confidence * 100).rounded()
        }
    }
}
