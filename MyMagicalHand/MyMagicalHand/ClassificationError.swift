import Foundation

enum ClassificationError: Error {
    case modelLoadFail
    case createImageFail
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .modelLoadFail:
            return NSLocalizedString("Failed to perform classification.", comment: "")
        case .createImageFail:
            return NSLocalizedString("Unable to create", comment: "")
        case .unknown:
            return NSLocalizedString("Unknown Error", comment: "")
        }
    }
}
