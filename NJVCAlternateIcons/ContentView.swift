//
//  ContentView.swift
//  NJVCAlternateIcons
//
//  Created by Slacker on 2/08/23.
//

import SwiftUI

struct ContentView: View {
    let myIcons = ["0","1","2","3","4"]
    var body: some View {
        Form{
            Section("Change Icon") {
                ForEach(myIcons, id: \.self) { iconName in
                    Button(action: {
                        updateIcon(name: iconName)
                    }, label: {
                        HStack{
                            Image(iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            Text(iconName)
                                .bold()
                        }
                    })

                }
            }
        }
    }
    
    func updateIcon(name: String){
        var iconName: String? = name
        print(name)
        if name == "0"{
            iconName = nil
        }else{
            iconName = "AppIcon" + name
        }
        
        print(iconName)
        
        UIApplication.shared.setAlternateIconName(iconName){ error in
            guard let error else{
                return
            }
            print("Error", error.localizedDescription)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
