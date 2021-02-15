//
//  MapView.swift
//  AdvancedPereferenceKey
//
//  Created by Hossam on 30/12/2020.
//

import SwiftUI

import Combine
class FakeData : ObservableObject {
    @Published var name : String = ""
}
struct EnviroView : View {
    @EnvironmentObject var name : FakeData
    @Environment(\.customeEnviromentKey) var x
    @State var presented = false
    var body: some View{
        Text(self.x)
            
            .sheet(isPresented: $presented, content: {
                Enviro2View()
                    
                    
                    
                    
                    
            })
            .onTapGesture(count: 1, perform: {
                presented.toggle()
                    
                
            })
    }
    
    
}

struct Enviro2View : View {
    @EnvironmentObject var name : FakeData
    @Environment(\.customeEnviromentKey) var colorSceme
    @State var  fakei = "Color.red"
    var body: some View{
        VStack{
            Text(name.name)
            Text("\(colorSceme)")
            
                .onTapGesture(count: 1, perform: {
                    transformEnvironment(\.customeEnviromentKey) { value in
                        
                        value = self.fakei
                    }
                })
        }
    }
}


struct CustomEnviromentKey : EnvironmentKey{
    static var defaultValue: String = "450"
    
    typealias Value = String
    
    
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        return EnviroView()
            .environmentObject({  () -> FakeData in
                let name : String = "Hossam"
                let fakeData = FakeData()
                fakeData.name = name
                return fakeData
            }())
    }
}



extension EnvironmentValues {
    var customeEnviromentKey : String {
        get {
            return  CustomEnviromentKey.defaultValue
        }
        set {
            CustomEnviromentKey.defaultValue = newValue
        }
    }
}
