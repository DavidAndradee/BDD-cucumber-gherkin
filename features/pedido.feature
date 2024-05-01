#language: pt

Funcionalidade: Pedidos

    Como um usuário do starbugs eu quero poder compra café. Para que eu possa receber os cafés em meu endereço e pagar somente na entrega.

@smoke
Cenário: Compra bem sucedida

    Dado que estou na página principal da Starbugs
        E que iniciei a compra do item "Expresso Tradicional"
    Quando faço a busa do seguinte CEP: "04534011"
        E informo os demais dados do endereço:
            | Numero      | 2520 |
            | Complemento | casa |
        E escolho a forma de pagamento "Cartão de Débito"
        E por fim finalizo a compra
    Então sou redirecionado para a página de confirmação de Pedidos
        E deve ser informado o seguinte prazo e entrega "20 min - 30 min"
