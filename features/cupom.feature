#language: pt

Funcionalidade: Uso de Cupons no Checkout de compra

    Como um usuário da Starbugs, Eu quero poder aplicar cupons de desconto na página de checkout, Para que eu possa obter reduções no preço de produtos ou na minha compra, aumentando a satisfação com a minha experiência de compra.

    Contexto:
        Dado que iniciei a compra do item
            | name     | Café com Leite |
            | price    | R$ 19,99       |
            | delivery | R$ 10,00       |
            | total    | R$ 29,99       |

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        @only
        Cenario: Aplicar Desconto de 20%
        
        Quando aplico o seguinte cupom: "MEUCAFE"
        Então o valor final da compra deve ser atualizado para "R$ 25,99"

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        Cenario: Cupom Expirado
        
        Quando aplico o seguinte cupom: "PROMO20"
        Então deve ser exibida a seguinte notificação "Cupom expirado!"
            E o valor final deve permanecer o mesmo

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        Cenario: Cupom Inválido

        Quando aplico o seguinte cupom: "PROMO100"
        Então deve ser exibida a seguinte notificação "Cupom inválido!"
            E o valor final deve permanecer o mesmo 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# >>>ALTERNATIVA DE REALIZAR O TESTE USANDO DE REUSO<<<
# Esquema do Cenário: Tentativa de aplicar o desconto

# Quando aplico o seguinte cupom "<cupom>"
# Então deve ser exibida a seguinte notificação "<saida>"
#     E o valor final deve permanecer o mesmo

# Exemplos:
# | cupom    | saida           |
# | PROMO20  | Cupom expirado! |
# | PROMO200 | Cupom inválido! |