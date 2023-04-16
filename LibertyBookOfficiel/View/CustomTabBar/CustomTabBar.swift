//
//  CustomTabBar.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 11/04/2023.
//

import SwiftUI

enum Tabs: String, CaseIterable {
    case house
    case book
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tabs.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .red : .gray)
                        .font(.system( size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    
                    Spacer()
                }
            }
            .frame(width: nil, height: 40)
            .background(.white)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.book))
    }
}
