

Dado('que iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end

Quando('faço a busa do seguinte CEP: {string}') do |cep_code|
    @checkout.find_cep_code(cep_code)
end

Quando('informo os demais dados do endereço:') do |table| 
    @checkout.fill_address(table.rows_hash)  
end

Quando('escolho a forma de pagamento {string}') do |payment_type|
    @checkout.choice_payment(payment_type)
end

Quando('por fim finalizo a compra') do
    @checkout.submit
end

Então('sou redirecionado para a página de confirmação de Pedidos') do
    @order.assert_order

end

Então('deve ser informado o seguinte prazo e entrega {string}') do |time_delivery|
    @order.assert_delivery_time(time_delivery)
end