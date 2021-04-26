import UIKit

class CanvasView: UIView {
    // MARK:- Properties
    private var touchPoint: CGPoint?
    private var currentPoint: CGPoint?

    // MARK:- Override Methods
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(), let touchPoint = self.touchPoint, let currentPoint = self.currentPoint else { return }
        setContext(context)
        context.move(to: CGPoint(x: touchPoint.x, y: touchPoint.y))
        context.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        context.strokePath()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchPoint = touches.first?.location(in: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        currentPoint = touches.first?.location(in: self)
        setNeedsDisplay()
    }
}

extension CanvasView {
    private func setContext(_ context: CGContext) {
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.round)
    }
}
