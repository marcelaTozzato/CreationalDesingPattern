//
//  AppSettings.swift
//  Singleton
//
//  Created by Marcela Limieri Tozzato on 16/08/21.
//

import Foundation

// final: previne a criação de subclasses
final public class AppSettings {
    
    // SOLUÇÃO INICIAL
    // tasks em serial queues são executadas uma por vez, e cada task inicia após a anterior ter sido finalizada
    // private let serialQueue = DispatchQueue(label: "serialQueue")
    
    //MELHOR PERFORMANCE:
    //Para melhorar a performance, ao invés de utilizar uma serial queue eu posso utilizar uma concurrent queue com barriers
    //Eu posso ler os valores do dicionario de forma concorrente, eu apenas não posso modifica-los.
    //Ao utilizar essa estratégia eu permito que os valores sejam lidos de forma sincrona e ao mesmo tempo, porém ao fazer uma modificação no dicionario eu envio uma barreira para que a thread se comporte como uma serial queue pelo tempo que eu estiver modificando o dicionário (nada será executado junto) e após essa task ser finalizada, a thread volta a se comportar como uma concurrent queue
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private var settings: [String: Any] = [:]
    
    // private init previne o acesso pelos clients
    private init() {}
    
    // static permite que os clients acessem a unica instancia dessa classe
    // static var são thread safety, portanto, acessar uma propriedade estática de várias threads concomitantemente não irá levar a varias instancias de AppSettings
    public static var shared = AppSettings()
    
    public func set(value: Any, forKey key: String) {
        // SOLUÇÃO INICIAL
        // serialQueue.sync {
        //     settings[key] = value
        // }
        
        //MELHOR PERFORMANCE:
        concurrentQueue.async(flags: .barrier) {
            self.set(value: value, forKey: key)
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        
        // SOLUÇÃO INICIAL:
        // serialQueue.sync {
        //     result = settings[key]
        // }
        
        //MELHOR PERFORMANCE:
        concurrentQueue.sync {
            result = settings[key]
        }
        
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}


