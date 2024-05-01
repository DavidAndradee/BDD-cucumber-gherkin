class HomePage
    include Capybara::DSL

    def open
        visit 'https://starbugs-qa.vercel.app/'
    end

    def coffee_list
        return all('.coffe-item') #pega os produtos e aloca na variavel coffe_list que pode ser usada nos steps
    end

    def buy(coffe_name)
        product = find('.coffee-item', text: coffe_name) #estar indo direto na classe do intem de café, referetne ao texto de Expresso gelado
        product.find('.buy-coffee').click
    end

end
