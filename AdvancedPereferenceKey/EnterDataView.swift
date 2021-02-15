//
//  EnterDataView.swift
//  AdvancedPereferenceKey
//
//  Created by Hossam on 30/12/2020.
//

import SwiftUI

struct EnterDataItemData : Equatable  , Identifiable {
    static func == (lhs: EnterDataItemData, rhs: EnterDataItemData) -> Bool {
        var result : Bool = false
       let _ =  GeometryReader{ proxy -> Color in
            
            result = proxy[lhs.frameAnchor] ==  proxy[rhs.frameAnchor]
            return Color.red
        }
        return result
        
    }
    
    var id: Int

   
    let color : Color
    let frameAnchor : Anchor<CGRect>
    
}


struct EnterDataPreferenceKey : PreferenceKey {
    static var defaultValue: [EnterDataItemData] = []
    
    static func reduce(value: inout [EnterDataItemData], nextValue: () -> [EnterDataItemData]) {
        value.append(contentsOf: nextValue())
    }
    
    typealias Value = [EnterDataItemData]
    
    
}

struct EnterDataView: View {
    var id: Int
    
    
    let title : String
    @State var text : String = ""
    var body: some View {
        ZStack{
            Color.init(.systemGray5)
            VStack(alignment:.leading){
                Text(title)
                    .fontWeight(.semibold)
                TextField(title, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(size: 16, weight: .semibold, design: .default))
                   
                
                
            }
            .padding()
        }
        .frame( height: 100 , alignment: .center)
        .cornerRadius(17)
        .anchorPreference(key: EnterDataPreferenceKey.self, value: Anchor.Source.bounds, transform: { anchor in
            let color : Color
            switch text.count {
            case _ where text.count > 3 : color = Color.green
            case _ where text.count == 2  : color = Color.yellow
            case _ where text.count < 1 : color = Color.red
            default : color = .red
            }
            
            return [EnterDataItemData.init(id: id, color: color, frameAnchor: anchor)]
        })
        
    }
}


