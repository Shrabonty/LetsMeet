//
//  SignUpView.swift
//  LetsMeet
//
//  Created by Shrabonty Biswas on 18.04.24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                Image(ImageName.backgroundImage)
                    //.resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                   .frame(width: geo.size.width, height: geo.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   .opacity(0.30)
                
                
                
                
            }
            .background(Color.PrimaryLight)
        }
    }
}

#Preview {
    SignUpView()
}
