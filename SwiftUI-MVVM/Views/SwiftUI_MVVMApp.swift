import SwiftUI

@main
struct InitializerApp: App {
    var body: some Scene {
        WindowGroup {
			NavigationView {
				LoginView(viewModel: .init(initialState: .init()))
			}
        }
    }
}
