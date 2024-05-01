Dado('que iniciei a compra do item') do |table|
    @product = table.rows_hash
    @home.open
    @home.buy(@product[:name])
end

Quando('aplico o seguinte cupom: {string}') do |code_cupom|
    @checkout.set_discont(code_cupom)
end

Então('o valor final da compra deve ser atualizado para {string}') do |final_price|
    @checkout.assert_total_price(final_price)
end

Então('deve ser exibida a seguinte notificação {string}') do |notice|
    @checkout.assert_notice(notice)
end

Então('o valor final deve permanecer o mesmo') do
    @checkout.assert_total_price(@product[:total])
end
  