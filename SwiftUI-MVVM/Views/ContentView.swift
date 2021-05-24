import SwiftUI

//	View
struct ContentView: View {
	
	@ObservedObject private var viewModel: ContentViewModel
	
	init(viewModel: ContentViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		Text(viewModel.content.isLoading ? "Carregando..." : viewModel.content.message)
			.onAppear(perform: viewModel.loadData)
    }
}

//	ViewModel
class ContentViewModel : ObservableObject {
	@Published private(set) var content: Content
	
	init(initialState: Content = .init()) {
		self.content = initialState
	}
	
	func loadData() {
		self.content.isLoading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
			self.content.isLoading = false
			self.content.message = "Olá SwiftUI!"
		})
	}
}

//	Model
struct Content {
	var isLoading = false
	var message = ""
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(viewModel: .init())
    }
}
