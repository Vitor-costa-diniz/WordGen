//
//  File.swift
//  
//
//  Created by Vitor Costa on 26/03/24.
//

import Foundation

enum GameOptions {
    static var hint = "!hint"
    static var quit = "!exit"
    static var resolve = "!resolve"
}

enum Constants {
    static let mockThemes: [String: [String]] = [
        "Esportes": ["futebol", "basquete", "tênis", "natação", "atletismo", "vôlei", "handebol", "ginástica", "ciclismo", "boxe", "judô", "ginástica", "surfe", "skate", "hóquei", "rúgbi", "golfe", "escalada", "canoagem", "esgrima", "taekwondo", "triatlo", "patinação", "lutalivre", "corrida", "futsal", "pentatlo", "saltosornamentais", "marchaatlética", "hóqueisobregrama"],
        "Comidas": ["pizza", "hambúrguer", "sushi", "pasta", "churrasco", "salada", "tacos", "miojo", "risoto", "ramen", "sashimi", "queijo", "bolo", "café", "sanduíche", "nachos", "crepe", "fondue", "tapioca", "feijoada", "sorvete", "tiramisù", "cuscuz", "ovo", "lasanha", "empada", "arroz", "sopa", "strogonoff", "coxinha"],
        "Animais": ["gato", "cachorro", "elefante", "tigre", "leão", "zebra", "girafa", "macaco", "panda", "pássaro", "cavalo", "papagaio", "rato", "tartaruga", "coelho", "golfinho", "peixe", "tubarão", "coruja", "lontra", "foca", "camelo", "canguru", "pinguim", "crocodilo", "raposa", "urso", "lobo", "borboleta", "abelha", "macaco"],
        "Países": ["Brasil", "EstadosUnidos", "Canadá", "França", "Alemanha", "Itália", "Espanha", "Portugal", "ReinoUnido", "Japão", "China", "Índia", "Rússia", "México", "Argentina", "Chile", "Colômbia", "Austrália", "NovaZelândia", "ÁfricadoSul", "Nigéria", "Egito", "Marrocos", "Turquia", "Suécia", "Noruega", "Finlândia", "Dinamarca", "Holanda", "Bélgica"],
        "Estados do Brasil": ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "EspíritoSanto", "Goiás", "Maranhão", "MatoGrosso", "MatoGrossodoSul", "MinasGerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "RiodeJaneiro", "RioGrandedoNorte", "RioGrandedoSul", "Rondônia", "Roraima", "SantaCatarina", "SãoPaulo", "Sergipe", "Tocantins"],
        "Frutas e Hortaliças": ["amora", "maçã", "banana", "abacaxi", "laranja", "morango", "uva", "limão", "pêssego", "melancia", "kiwi", "pera", "manga", "abacate", "melão", "caqui", "jabuticaba", "cereja", "framboesa", "goiaba", "figo", "batata", "cenoura", "alface", "tomate", "cebola", "abóbora", "mandioca", "beterraba", "brócolis"]
    ]
}
