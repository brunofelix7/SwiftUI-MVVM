import Foundation

struct User {
	var email: String = ""
	var password: String = ""
	var isLoggedIn: Bool = false
	var isShowErrorMessage: Bool = false
}

//	Propriedades Computadas - Não guardam valores, são computadas ou avaliadas em tempo de execução
extension User {
	var canSubmit: Bool {
		email.isEmpty == false && password.isEmpty == false
	}
	
	var footerMessage: String {
		isLoggedIn ? "Fazendo login..." : ""
	}
}
