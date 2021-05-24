import Foundation
import SwiftUI

final class LoginViewModel : ObservableObject {
	
	@Published private(set) var user: User
	
	var bindings: (email: Binding<String>, password: Binding<String>, isShowErrorMessage: Binding<Bool>) {
		(
			email: Binding(to: \.user.email, on: self),
			password: Binding(to: \.user.password, on: self),
			isShowErrorMessage: Binding(to: \.user.isShowErrorMessage, on: self)
		)
	}
	
	init(initialState: User = .init()) {
		self.user = initialState
	}
	
	func login() {
		self.user.isLoggedIn = true
		
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
			self.user.isLoggedIn = false
			self.user.isShowErrorMessage = true
		}
	}
}
