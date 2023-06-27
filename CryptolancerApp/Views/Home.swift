//
//  Home.swift
//  GameStream
//
//  Created by Mariano Obligado on 08/05/2023.
//

import SwiftUI
import AVKit
import MobileCoreServices

struct Home: View {
    
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado){
            
            Perfil()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            
            
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Favoritos()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(Color("cryptoColor"))
        
        
    }
    
    
    init(){
        UITabBar.appearance().barTintColor = UIColor( Color("tabBarColor"))
        UITabBar.appearance().isTranslucent = true
        print("iniciando vistas de Home")
    }
    
    
}



struct PantallaHome:View{
    
    @State var textoBusqueda = ""
    
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            
            VStack{
                
                Image("logoLargo").resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width: 250)
                    .padding(.horizontal, 13)
                    .padding(.bottom)
                
                
                HStack {
                    
                    Button(action:busqueda, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("cryptoColor")
                        ) //Ternario que cambia el color segun el texto de busqueda tenga contenido o no.
                    })
                    
                    
                    ZStack(alignment: .leading) {
                        if textoBusqueda.isEmpty{
                            
                            Text("Buscar un empleo").foregroundColor(Color(.white))
                        }
                        
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                    }
                    
                    
                }.padding([.top, .leading,.bottom], 11)
                    .background(Color(.black))
                    .clipShape(Capsule())
                
                
                
                
                
                
                
                ScrollView{
                    
                    
                    VStack {
                        Text("EMPLEOS DESTACADO")
                            .font(.title2)
                            .foregroundColor(.black)
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        
                        Image("solidity").resizable().scaledToFit()
                            .frame(width: 350, height: 200)
                            .background(Color(.gray))
                            .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                        
                        Text("Blockchain Developer")
                            .font(.title2)
                            .foregroundColor(.black)
                            .bold()
                            .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                        
                        
                        Text("EXPLORAR POR TECNOLOGÏAS")
                            .font(.title3)
                            .foregroundColor(.black)
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding([.top, .bottom])
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack{
                                
                                Button(action: {}, label: {
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("cryptoColor"))
                                            .frame(width: 160, height: 90)
                                        
                                        VStack {
                                            Image(systemName: "apple.logo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 42)
                                                .foregroundColor(.white)
                                            Text("iOS Developer")
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                
                                Button(action: {}, label: {
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("cryptoColor"))
                                            .frame(width: 160, height: 90)
                                        
                                        VStack {
                                            Image("android")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 42)
                                                .foregroundColor(.white)
                                            Text("Android Developer")
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                
                                Button(action: {}, label: {
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("cryptoColor"))
                                            .frame(width: 160, height: 90)
                                        
                                        VStack {
                                            Image("java3")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 42)
                                                .foregroundColor(.white)
                                            Text("Java Developer")
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                
                                
                                Button(action: {}, label: {
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("cryptoColor"))
                                            .frame(width: 160, height: 90)
                                        
                                        VStack {
                                            Image(systemName: "gamecontroller.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 42)
                                                .foregroundColor(.white)
                                            Text("Game Tester")
                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                                
                            }
                            
                        }
                        
                        Text("RECOMENDADOS")
                            .font(.title3)
                            .foregroundColor(.black)
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding([.top, .bottom])
                        
                        
                        EmpleosRecomendados()
                        
                    }
                }
                
                
                
                
                
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
    }
    
    func busqueda() {
        print("el usuario está bucando \(textoBusqueda)")
    }
    
    
} 

struct EmpleosRecomendados:View{
    
    var body: some View{
        VStack{
            
            Image("solidity").resizable().scaledToFit()
                .frame(width: 350, height: 200)
                .background(Color(.gray))
                .cornerRadius(8.0)
            
            Text("Blockchain Developer")
                .font(.title2)
                .foregroundColor(.black)
                .bold()
                .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
            
            Image("solidity").resizable().scaledToFit()
                .frame(width: 350, height: 200)
                .background(Color(.gray))
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
            
            Text("Blockchain Developer")
                .font(.title2)
                .foregroundColor(.black)
                .bold()
                .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
            
            Image("solidity").resizable().scaledToFit()
                .frame(width: 350, height: 200)
                .background(Color(.gray))
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
            
            Text("Blockchain Developer")
                .font(.title2)
                .foregroundColor(.black)
                .bold()
                .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
            
        }
    }
    
}

struct Perfil:View {
    
    
    var body: some View {
        ZStack{
            Color(.white).ignoresSafeArea()
            
            VStack{
                
                Image("logoLargo").resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width: 250)
                    .padding(.horizontal, 13)
                    .padding(.bottom)
                
                ScrollView{
                    
                    
                    HStack {
                        Image("vitalik")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: 70, height: 70)
                            .cornerRadius(50.0)
                            .padding(.trailing)
                        Divider()
                        
                        VStack {
                            Text("Vitalik Buterin")
                                .font(.title)
                            
                            Text("Founder - Ethereum")
                                .font(.subheadline)
                        }
                    }.padding(.bottom)
                    
                    
                    Text("EXPERIENCIA")
                        .font(.title2)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .bold()
                    
                    Text("TECNOLOGÍAS")
                        .font(.title2)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .bold()
                    
                    
                }
            }
        }
    }
}


struct Favoritos:View{
    var body: some View{
        ZStack{
            Color(.white).ignoresSafeArea()
            
            VStack{
                
                Image("logoLargo").resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width: 250)
                    .padding(.horizontal, 13)
                    .padding(.bottom)
                
                ScrollView{
                    Text("EMPLEOS GUARDADOS")
                        .font(.title2)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .bold()
                    EmpleosRecomendados()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        Perfil()
    }
}

