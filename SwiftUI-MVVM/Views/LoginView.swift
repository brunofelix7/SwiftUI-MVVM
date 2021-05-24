import SwiftUI

struct LoginView: View {
	
	@ObservedObject private var viewModel: LoginViewModel
	
	init(viewModel: LoginViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		Form {
			Section(footer: formFooter, content: {
				TextField("email", text: viewModel.bindings.email)
					.keyboardType(.emailAddress)
					.autocapitalization(.none)
				SecureField("senha", text: viewModel.bindings.password)
			})
		}
		.navigationBarTitle("Login")
		.navigationBarItems(trailing: submitButton)
		.disabled(viewModel.user.isLoggedIn)
		.alert(isPresented: viewModel.bindings.isShowErrorMessage) {
			Alert(
				title: Text("Erro ao fazer login"),
				message: Text("Usuário e senha inválidos")
			)
		}
    }
	
	private var formFooter: some View {
		Text(viewModel.user.footerMessage)
	}
	
	private var submitButton: some View {
		Button("Entrar", action: {
			self.viewModel.login()
		})
		.disabled(viewModel.user.canSubmit == false)
	}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			LoginView(viewModel: .init(initialState: .init()))
		}
    }
}
