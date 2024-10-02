//
//  LifeCreationView.swift
//  LifeCreation
//
//  Created by Evelina on 01.10.2024.
//

import SwiftUI
import CoreData

struct LifeCreationView: View {
    
    private enum UIConstants {
        static let contentInset: CGFloat = 16
        static let titleTextFontSize: CGFloat = 20
        static let vStackSpacing: CGFloat = 10
        static let buttonTextVerticalInset: CGFloat = 10
        static let buttonTextFontSize: CGFloat = 14
        static let buttonCornerRadius: CGFloat = 4
        static let cellsSpacing: CGFloat = 4
        static let viewVerticalInset: CGFloat = 6
    }
    
    @StateObject var viewModel: LifeCreationViewModel
    
    @ViewBuilder var listOfCells: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: UIConstants.cellsSpacing) {
                    ForEach(viewModel.cells, id: \.id) { cell in
                        CellView(type: cell.type)
                            .id(cell.id)
                    }
                }
                .padding()
            }
            .onChange(of: viewModel.cells.count) { _ in
                withAnimation {
                    proxy.scrollTo(viewModel.cells.last?.id, anchor: .bottom)
                }
            }
        }
    }

    var body: some View {
        ZStack {
            VStack(spacing: UIConstants.vStackSpacing) {
                Text("Клеточное наполнение")
                    .font(.custom("Roboto-Medium", size: UIConstants.titleTextFontSize))
                    .foregroundColor(.white)
                
                listOfCells
                
                Button(action: {
                    withAnimation(viewModel.cells.isEmpty ? nil : .default) {
                        viewModel.createNewCell()
                    }
                }){
                    Text("СОТВОРИТЬ")
                        .font(.custom("Roboto-Medium", size: UIConstants.buttonTextFontSize))
                        .foregroundColor(.white)
                        .padding(.vertical, UIConstants.buttonTextVerticalInset)
                        .frame(maxWidth: .infinity)
                }
                .background(Color("buttonColor", bundle: nil))
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.buttonCornerRadius))
                .padding(.horizontal, UIConstants.contentInset)
            }
        }
        .padding(.vertical, UIConstants.viewVerticalInset)
        .background(LinearGradient(colors: [Color("purpleBackgroundColor", bundle: nil), .black],
                                   startPoint: .top,
                                   endPoint: .bottom))
    }
}

