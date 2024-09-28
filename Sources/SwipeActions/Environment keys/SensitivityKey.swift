import SwiftUI

struct SensitivityKey: EnvironmentKey {
    static let defaultValue: CGFloat? = nil
}

public extension EnvironmentValues {
    var sensitivity: CGFloat? {
        get { self[SensitivityKey.self] }
        set { self[SensitivityKey.self] = newValue }
    }
}

public extension View {

    /// Set the sensitivity for ``View`` component with  ``SwipeAction``.
    ///
    /// - Parameters:
    ///   - sensitivity: A sensitivity that will be used in  ``SwipeAction`` drag gesture.
    ///    Pass `nil` to ignore environment sensitivity and to allow the system to provide its own sensitivity.
    func swipeSensitive(_ sensitivity: Sensitivity?) -> some View {
        environment(\.sensitivity, sensitivity?.value)
    }

    func swipeSensitive(custom sensitivity: CGFloat?) -> some View {
        environment(\.sensitivity, sensitivity)
    }
}
