Quando('acesso a página principal do Starbugs') do
    @home.open
end
  
Então('deve ser exibida uma lista de cafés disponiveis') do
    products = all('.coffee-item') #pega os produtos e aloca na variavel products
    expect(products.size).to be > 0 #retorna o tamanho da lista, ou seja, a quantidade de cafés
end

Dado('que estou na página principal da Starbugs') do
    @home.open
end

Dado('que desejo comprar o seguinte produto') do |table|
    @product = table.rows_hash
end
  
# Dado('que desejo comprar o café {string}') do |product_name|
#     @product_name = product_name #alocando o nome do produto a uma variavel, que possa ser reutilizada em outras chamadas
# end
  
# Dado('que esse produto custa {string}') do |product_value|
#     @product_value = product_value #alocando o preço do produto a uma variavel, que possa ser reutilizada em outras chamadas
# end
  
# Dado('que o custo de entrega é de {string}') do |delivery_value|
#     @delivery_value = delivery_value #alocando o preço da entrega do produto a uma variavel, que possa ser reutilizada em outras chamadas
# end

Quando('inicio a compra desse item') do
    @home.buy(@product[:name])
end
  
Então('deve ser exibida a página de checkout com os detalhes do produto') do
    @checkout.assert_details_product(@product)
    product_title = find('.item-details h1') #busca pela calsse e aloca na variavel product_title
    expect(product_title.text). to eql @product[:name] #realiza a verificação de igualdade do nomo do produto com o texto exibido

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql @product[:price] #realiza a verificação de igualdade do preço do produto com o texto de valor exibido

    delivery = find('.delivery-price')
    expect(delivery.text).to eql @product[:delivery] #realiza a verificação de igualdade do preço de entrega do produto com o texto de valor exibido
end
  
Então('o valor total do produto deve ser de {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

Então('devo ver um popup informando que o produto está indisponivel') do
    @popup.have_text('Produto indisponível')
end
  
  
