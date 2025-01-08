//
//  LinearDivider.swift
//  X&Overse
//
//  Created by Elvis Rexha on 08/01/2025.
//

import SwiftUI

struct LinearDivider: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 3)
                .padding(15)
            .foregroundStyle(
                LinearGradient(
                    colors: [.white.opacity(0.2), .white.opacity(0.3), .white.opacity(0.4),
                        .white.opacity(0.6), .white.opacity(0.9), .white, .white.opacity(0.6),
                             .white.opacity(0.4),
                             .white.opacity(0.3), .white.opacity(0.2)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

#Preview {
    LinearDivider()
}
