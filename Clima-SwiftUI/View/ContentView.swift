//
//  ContentView.swift
//  Clima-SwiftUI
//
//  Created by Abdul R. Arraisi on 03/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var location: String = ""
    
    var manager = WheatherManager()
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .trailing, spacing: 20, content: {
                
                HStack {
                    
                    Image(systemName: "location.circle.fill")
                    
                    TextField("Search", text: $location, onCommit:  {
                        print("User typed \(location)")
                        manager.fetchWhether(city: location)
                    })
                    .multilineTextAlignment(.trailing)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    
                    Button(action: {
                        print("User typed \(location)")
                        manager.fetchWhether(city: location)
                        
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    
                }.font(Font.system(size: 25)).padding(.horizontal, 10)
                
                Image(systemName: "sun.max")
                    .font(Font.system(size: 100))
                
                HStack(spacing: 0) {
                    
                    Text("21")
                        .fontWeight(.black)
                        .font(Font.system(size: 80))
                    
                    Text("°C")
                        .font(Font.system(size: 80))
                }
                
                Text("London")
                    .fontWeight(.regular)
                    .font(Font.system(size: 30))
                
                Spacer()
                
            })
            .padding(.trailing, 20)
            .padding(.top, 40)
            
        }
        .background(
            Image("BG")
                .resizable().aspectRatio(contentMode: .fill))
        .ignoresSafeArea(edges: .all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
        ContentView().environment(\.colorScheme, .dark)
    }
}
