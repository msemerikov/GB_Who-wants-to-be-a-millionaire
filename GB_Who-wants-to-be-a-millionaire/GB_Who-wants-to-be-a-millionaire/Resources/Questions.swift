//
//  Questions.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Questions {
    var questions: [Question]
    
    init() {
        self.questions = [
            Question(question: "Что может появится в доме во время семейной ссоры?", answers: ["летающие тарелки", "снежный человек", "Бермудский треугольник", "Тунгусский метеорит"], rightAnswer: 1),
            Question(question: "Что портной снимает с заказчика?", answers: ["мерку", "марку", "бурку", "шкурку"], rightAnswer: 1),
            Question(question: "Что особенно заботит каждого культуриста?", answers: ["умножение", "деление", "сложение", "вычитание"], rightAnswer: 3),
            Question(question: "О каких сапогах говорят, имея в виду полную нелепость, бессмыслицу?", answers: ["всмятку", "вкрутую", "в мешочек", "в гоголь-моголь"], rightAnswer: 1),
            Question(question: "Как греки сами называют свою страну?", answers: ["Паллала", "Эллада", "Колхида", "Илиада"], rightAnswer: 2),
            Question(question: "Что Лермонтов в стихотворении «Бородино» назвал избитым?", answers: ["полк французов", "барабан", "кивер", "старую шутку"], rightAnswer: 3),
            Question(question: "Что, согласно рецепту, необходимо положить внутрь котлеты по-киевски?", answers: ["куриное сердечко", "майонез", "сливочное масло", "сало"], rightAnswer: 3),
            Question(question: "Жену какого посла воспел Александр Городницкий в своей известной песне?", answers: ["немецкого", "сенегальского", "французского", "советского"], rightAnswer: 3),
            Question(question: "В каких спортивных состязаниях не используется сетка?", answers: ["баскетбол", "регби", "бадминтон", "метание молота"], rightAnswer: 2),
            Question(question: "Чем на Руси занимался золотарь?", answers: ["добывал золото", "ковал оружие", "заведовал казной", "чистил отхожие места"], rightAnswer: 4),
            Question(question: "Как называется метеорный поток, наблюдаемый ежегодно в ноябре?", answers: ["Леониды", "Максимы", "Иваны", "Гавриилы"], rightAnswer: 1),
            Question(question: "Как герой фильма «Белорусский вокзал» назвал свой батальон?", answers: ["непотопляемый", "непромокаемый", "непобедимый", "неприступный"], rightAnswer: 2),
            Question(question: "Какая из башен Московского Кремля самая высокая?", answers: ["Троицкая", "Водовзводная", "Спасская", "Беклемишевская"], rightAnswer: 1),
            Question(question: "Какой словарной статьи нет в толковом словаре Владимира Даля?", answers: ["чебурахать", "чеколдыкать", "чекошиться", "чекать"], rightAnswer: 2),
            Question(question: "Какое небесное тело не является астероидом?", answers: ["Юнона", "Психея", "Миранда", "Цирцея"], rightAnswer: 3)
        ]
    }
}
