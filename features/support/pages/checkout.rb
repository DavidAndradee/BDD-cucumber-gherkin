require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers


    def assert_details_product(product)
        product_title = find('.item-details h1') #busca pela calsse e aloca na variavel product_title
        expect(product_title.text). to eql product[:name] #realiza a verificação de igualdade do nomo do produto com o texto exibido

        sub_price = find('.subtotal .sub-price')
        expect(sub_price.text).to eql product[:price] #realiza a verificação de igualdade do preço do produto com o texto de valor exibido

        delivery = find('.delivery-price')
        expect(delivery.text).to eql product[:delivery] #realiza a verificação de igualdade do preço de entrega do produto com o texto de valor exibido
    end

    def assert_total_price(total_price)
        price = find('.total-price')
        expect(price.text). to eql total_price
    end

    def find_cep_code(cep_code)
        find('input[name=cep]').set(cep_code)
        click_on 'Buscar CEP'
    end

    def fill_address(address)
        find('input[name=number]').set(address[:Numero])
        find('input[name=complement]').set(address[:Complemento])
    end

    def choice_payment(payment_type)
        find('label div',text: payment_type.upcase).click
    end

    def submit
        click_on 'Confirmar pedido'
    end

    def set_discont(code_cupom)
        find('input[placeholder="Código do cupom"]').set(code_cupom)
            click_on 'Aplicar'
    end

    def assert_notice(text)
        notice = find('.notice').text
        expect(notice).to eql text
    end

end