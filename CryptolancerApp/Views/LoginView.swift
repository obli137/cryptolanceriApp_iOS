//
//  ContentView.swift
//  GameStream
//
//  Created by Mariano Obligado on 05/05/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {

        NavigationStack{
            
      
            ZStack {
                Color.white
                    VStack{

                        Image("logoLargo").resizable().aspectRatio(contentMode:.fit).frame(width: 250).padding(.bottom , 42).padding(.top, 40)
                        InicioYRegistroView()
                    }
            }
        }
        
        
    }
}

struct InicioYRegistroView:View {
    
    
    @State var tipoInicioSesion = true
    
    
    
    var body: some View{
        

        VStack{
            
            HStack {
                
                Spacer()
                Button("INICIAR SESIÓN"){
                    tipoInicioSesion = true
                    print("Pantalla inicio sesión")
                }
                .foregroundColor(tipoInicioSesion ? .blue : .black)
                
                Spacer()
                Button("REGISTRARSE"){
                    
                    tipoInicioSesion = false
                    print("Pantalla de registro")
                }
                .foregroundColor(tipoInicioSesion ? .black : .blue)
                
                Spacer()
                
            }
            
            Spacer(minLength: 30)
            if tipoInicioSesion == true {
                
                InicioSesionView()
                
                
            }else{
                RegistroView()
            }
            
        }
    }
}


struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contrasenia = ""
    @State var isPantallaHomeActive = false
    
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                Text("Email").foregroundColor(.black).bold()
                
                ZStack(alignment:.leading){
                    
 
        
                    TextField("nombre@gmail.com", text: $correo).font(.caption).foregroundColor(Color(.gray))
                    
                }
                
                
                Divider().frame( height: 1).background(Color("cryptoColor"))
                    .padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.black).bold()
                
                ZStack(alignment:.leading){
                    
                    if contrasenia.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        
                    }
                    SecureField("", text: $contrasenia)
                    
                }
                
                
                Divider().frame( height: 1).background(Color("cryptoColor"))
                
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width:300, alignment: .trailing).foregroundColor(Color.black)
                    .padding(.bottom, 40)
                
               
      
                    
                    
                NavigationLink(destination: Home()) {
                       Text("INICIAR SESIÓN")
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                           .frame(maxWidth: .infinity, alignment: .center)
                           .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                           .background(Color("cryptoColor"))
                           .cornerRadius(6)
                           .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                   }
                    
                    
                
                
              
          
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 60)
                
                HStack{
                    
                    Button(action: iniciarSesionGoogle, label: {Text("Google")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 140, height: 7)
                            .padding()
                            .background(Color(.gray))
                        
                    })
                    .cornerRadius(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
                    
                    Button(action: iniciarSesionLinkedin, label: {Text("Linkedin")
                            .foregroundColor(.white)
                            .frame(width: 140, height: 7)
                            .padding()
                            .background(Color(.gray))
                            .bold()

                        
                    })
                    .cornerRadius(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
      
                }
      
            }
            
        }.padding(.horizontal, 50)
        
       
          
        
 
        
        
    }
 
    
    
    
    
    func iniciarSesion(){
        print("Iniciando sesion")
        
        isPantallaHomeActive = true
    }
    
}







func iniciarSesionGoogle(){
    print("Inicio con Google")
}

func iniciarSesionLinkedin(){
    print("Inicio con Linkedin")
}


struct RegistroView:View {
    
    @State var correo = ""
    @State var contrasenia = ""
    @State var confirmarContrasenia = ""
    
    
    var body: some View {
        
     
        ScrollView {
            
            VStack(alignment: .center){
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                
                Button(action: tomarFoto, label: {
                    
                    ZStack {
                        Image("mono")
                            .resizable()
                            .aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                            .cornerRadius(/*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        
                        Image(systemName: "camera").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(Color(.white))
                        
                        
                    }
                    
                }).padding(.bottom)
                
                
                
            }
            
            
            
            VStack(alignment: .leading) {
                
                VStack{
                    
                    
                    Text("Correo electrónico*").foregroundColor(Color( .black))
                        .frame(width: 350, alignment: .leading)
                    
                    ZStack(alignment:.leading){
                        
                        if correo.isEmpty{
                            Text("ejemplo@gmail.com").font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        
                        TextField("", text: $correo)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                    Divider().frame( height: 1).background(Color("cryptoColor"))
                        .padding(.bottom)
                    
                    
                    Text("Contraseña").foregroundColor(.black)
                        .frame(width: 350, alignment: .leading)
                    
                    ZStack(alignment:.leading){
                        
                     
                        SecureField("Escribe tu contraseña", text: $contrasenia)
                           .font(.caption).foregroundColor(.gray)
                        
                    }
                    
                    
                    Divider().frame( height: 1).background(Color("cryptoColor")).padding(.bottom)
                    
                    Text("Confirmar contraseña").foregroundColor(.black)
                        .frame(width: 350, alignment: .leading)
                    
                    
                    ZStack(alignment:.leading){
                        
                        if confirmarContrasenia.isEmpty{
                            Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                            
                        }
                        SecureField("", text: $confirmarContrasenia)
                            .font(.caption).foregroundColor(.gray)
                        
                    }
                    
                    Divider().frame( height: 1).background(Color("cryptoColor")).padding(.bottom)
                    
                    
                    
                    
                    
                    Button(action: registrate, label: {Text("REGÍSTRATE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("cryptoColor"))
                           
                        
                    })
                    .cornerRadius(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
                }
                //Botones
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                HStack{
                    
                    Button(action: iniciarSesionGoogle, label: {Text("Google")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 7, alignment: .center)
                            .padding()
                            .background(.gray)
                        
                        
                        
                    })
                    .cornerRadius(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
                    
                    Button(action: iniciarSesionLinkedin, label: {Text("Linkedin")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 7, alignment: .center)
                            .padding()
                            .background(.gray)
                    }).cornerRadius(6.0)
                    
                }
                
                
                
            }
            
        }.padding(.horizontal, 60)
        
        
    }
}


func tomarFoto(){
    print("Voy a tomar foto de perfil")
}

func registrate(){
    print("Me registro")
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        LoginView()
        
        
    }
}
