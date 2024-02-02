//
//  AddGameForm.swift
//  ScoreKeeper
//
//  Created by Ivanov, D. (Dmitrii) on 30/01/2024.
//

import SwiftUI

struct AddGameForm: View {
    
    var viewModel: GamesModel
    @Binding var isPresented: Bool
    
    @State private var newGameType: String = ""
    @State private var newGamePartner: String = ""
    @FocusState private var focusedField: Bool?
    private let backgroundColor = Color(uiColor: .systemGroupedBackground)
    
    init(viewModel: GamesModel, isPresented: Binding<Bool>) {
        _isPresented = isPresented
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 2)
                if #available(iOS 16.0, *) {
                    Form {
                        Section {
                            TextField("Game type", text: $newGameType)
                                .focused($focusedField, equals: true)
                                .navigationBarTitle(Text("New game"))
                        }
                        Section {
                            TextField("Partner", text: $newGamePartner)
                                .focused($focusedField, equals: true)
                                .navigationBarTitle(Text("New game"))
                        }
                    }
                    .scrollContentBackground(.hidden)
                } else {
                    Form {
                        Section {
                            TextField("Game type", text: $newGameType)
                                .focused($focusedField, equals: true)
                                .navigationBarTitle(Text("New game"))
                        }
                        Section {
                            TextField("Partner", text: $newGamePartner)
                                .focused($focusedField, equals: true)
                                .navigationBarTitle(Text("New game"))
                        }
                    }
                    .background(backgroundColor)
                }
                Button(action: {
                    viewModel.addNewGameType(newGameType, partner: newGamePartner)
                    isPresented = false
                }) {
                    Text("Add")
                }
            }
            .background(backgroundColor)
            .navigationTitle("New Game Type")
        }
        .onAppear {
            focusedField = true
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AddGameForm_Previews: PreviewProvider {
    static var previews: some View {
        AddGameForm(viewModel: GamesModel(), isPresented: .constant(false))
    }
}
