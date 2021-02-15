//
//  ContentView.swift
//  AdvancedPereferenceKey
//
//  Created by Hossam on 30/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var showTwitter : Bool = false
    var body: some View {
        VStack{
            Toggle("", isOn: $showTwitter)
            HStack{
                EnterDataView(id: 0, title: "Enter Name ")
                EnterDataView(id: 1, title: "Middle Name")
                EnterDataView(id: 2, title: "Last Name ")
                
            }
           
            HStack{
                EnterDataView(id: 3, title: "Email ")
                if showTwitter{
                    EnterDataView(id: 4, title: "Twitter ")
                }
                
            }
           
        }
        .padding()
        
        .overlayPreferenceValue(EnterDataPreferenceKey.self, { value in
            GeometryReader{geo in
                self.geo(proxy: geo, refs: value)
            }
        })
        .animation(.easeIn)
        
    }
    
    
    func geo(proxy : GeometryProxy , refs : [EnterDataItemData])-> some View {
        return
            ForEach(refs) {
                let rect = proxy[$0.frameAnchor]
            
                MapViewItem(color: $0.color)
                    .frame(width: rect.width, height: rect.height, alignment: .center)
                .position(x: rect.midX, y: rect.midY)

        }
            
            
        
            
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/800.0/*@END_MENU_TOKEN@*/, height: 800))
            
            
    }
}

}
