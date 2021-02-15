//
//  MapView.swift
//  AdvancedPereferenceKey
//
//  Created by Hossam on 30/12/2020.
//

import SwiftUI


struct MapViewItem: View  {
   
    
    @State var color : Color
    var body: some View {
        ZStack{
        Color.gray
            VStack{
                Spacer()
                color
                    .frame( height: 60, alignment: .center)
                    .padding()
            }
        }
        
        
            
    }
}


struct MapViewItem_Previews: PreviewProvider {
    static var previews: some View {
        MapViewItem(color: .red)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
