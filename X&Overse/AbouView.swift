//
//  AbouView.swift
//  X&Overse
//
//  Created by Elvis Rexha on 08/01/2025.
//

import SwiftUI

enum GameResult: String, Identifiable, CaseIterable {
    case win
    case defeat
    case draw
    
    var id: Self {
        self
    }
    
    var resultTitle: String {
        rawValue.uppercased()
    }
    
    var resultDescription: String {
        switch self {
        case .win:
            return "Get 3 marks in a row,\nPlayer wins, game ends."
        case .defeat:
            return "Opponent gets 3 in a row,\nPlayer loses, game ends."
        case .draw:
            return "Board full, no 3 in a row,\nNow winner, game ends."
        }
    }
//    
    var resultSymbol: ImageResource {
        switch self {
        case .win:
                .trophy
        case .defeat:
                .loser
        case .draw:
                .draw
        }
    }
    
//    var resuleImage: String {
//        switch self {
//        case .win:
//            <#code#>
//        case .defeat:
//            <#code#>
//        case .draw:
//            <#code#>
//        }
//    }
    
    
}

struct AbouView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
                
                VStack(alignment: .leading) {
                    
                    Text("Game Rules")
                        .fontDesign(.monospaced)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundStyle(.white)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 70 ,height: 3)
                        .foregroundStyle(.gray)
                    
                    VStack(spacing: 0) {
                        ForEach(GameResult.allCases) { result in
                            gameResultRow(gameResult: result)
                        }
                    }
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(15)
                .padding(.top, 40)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .imageScale(.large)
                        .padding(10)
                        .padding(.horizontal, 6)
                        .background(.ultraThinMaterial, in: .rect(cornerRadius: 15))
                        .contentShape(.rect)
                        .onTapGesture {
                            dismiss()
                        }
                       
                }
            }
        }
    }
    
    @ViewBuilder
    func gameResultRow(gameResult: GameResult) -> some View {
        VStack(alignment: .leading) {
            HStack(alignment: .lastTextBaseline, spacing: 12) {
                Image(gameResult.resultSymbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 6) {
                    Text(gameResult.resultTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                    Text(gameResult.resultDescription)
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray4))
                    
                    
                }
                
                Image(.ticTacToe)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .frame(maxWidth: .infinity, alignment: .trailing)
               
            }
            .frame(height: 120)
            
            if gameResult.id != .draw {
                LinearDivider()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    AbouView()
}
