#language: pt

Funcionalidade: catálago de cafés
    Como um usuário do site, eu quero ver o catálago de cafés na pagina principal. Escolher um café e saber mais sobre os produtos disponiveis.

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Cenário: Acessar o catalago de cafés na pagina principal
    Quando acesso a página principal do Starbugs
    Então deve ser exibida uma lista de cafés disponiveis
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Cenário: Iniciar compra de um café

    Dado que estou na página principal da Starbugs
        E que desejo comprar o seguinte produto
        # | product         | price   | delivery |
        # | Expresso Gelado | R$ 9,99 | R$ 10,00 |
        | name     | Expresso Gelado    |
        | price    | R$ 9,99            |
        | delivery | R$ 10,00           | 
    Quando inicio a compra desse item 
    Então deve ser exibida a página de checkout com os detalhes do produto
        E o valor total do produto deve ser de "R$ 19,99"
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Cenário: Café indisponivel
    Dado que estou na página principal da Starbugs
        E que desejo comprar o seguinte produto
        | name     | Expresso Cremoso    |
    Quando inicio a compra desse item
    Então devo ver um popup informando que o produto está indisponivel
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Cenário: Iniciar compra do café Macchiato

    Dado que estou na página principal da Starbugs
        E que desejo comprar o seguinte produto
        | name     | Macchiato |
        | price    | R$ 19,99  |
        | delivery | R$ 10,00  |  
    Quando inicio a compra desse item
    Então deve ser exibida a página de checkout com os detalhes do produto 
        E o valor total do produto deve ser de "R$ 29,99"