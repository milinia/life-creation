//
//  CellView.swift
//  LifeCreation
//
//  Created by Evelina on 01.10.2024.
//

import SwiftUI

struct CellView: View {
    
    private enum UIConstants {
        static let contentInset: CGFloat = 16
        static let imageWidth: CGFloat = 40
        static let imageHeight: CGFloat = 40
        static let cellTitleFontSize: CGFloat = 20
        static let cellDescriptionFontSize: CGFloat = 14
        static let hStackSpacing: CGFloat = 16
        static let cellCornerRadius: CGFloat = 8
    }
    
    let type: CellType
    
    var body: some View {
        HStack(spacing: UIConstants.hStackSpacing) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(colors: [type.gradientColor1, type.gradientColor2], 
                                       startPoint: .top,
                                       endPoint: .bottom))
                Text(type.icon)
            }
            .frame(width: UIConstants.imageWidth,
                   height: UIConstants.imageHeight)
            VStack(alignment: .leading) {
                Text(type.text)
                    .font(.custom("Roboto-Medium",
                                  size: UIConstants.cellTitleFontSize))
                Text(type.description)
                    .font(.custom("Roboto-Regular",
                                  size: UIConstants.cellDescriptionFontSize))
            }
            Spacer()
        }
        .padding(UIConstants.contentInset)
        .background(Color.white)
        .cornerRadius(UIConstants.cellCornerRadius)
    }
}
