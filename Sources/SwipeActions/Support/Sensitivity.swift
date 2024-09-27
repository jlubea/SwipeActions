import Foundation

public enum Sensitivity: Equatable {
    /// Sensitivity 30.
    case low
    /// Sensitivity 20.
    case medium
    /// Sensitivity 15.
    case high

    /// ViKit `Icon` ``Icon/Size`` value.
    public var value: CGFloat {
        switch self {
        case .low:
            return 30
        case .medium:
            return 20
        case .high:
            return 15
        }
    }
}
