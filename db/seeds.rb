# encoding:utf-8
# Used to create sample data
user = User.create(:email => "boris@example.com", :password => "demo123", :password_confirmation => "demo123", :first_name => "Boris", :last_name => "Barroso Camberos")

User.confirm_by_token(user.confirmation_token)

UserSession.current_user = user

# Countries
YAML.load_file('config/defaults/countries.yml').each { |c| Country.create!(c) }
# Currencies
YAML.load_file('config/defaults/currencies.yml').each { |c| Currency.create!(c) }
#taxes = [{:name => "Impuesto al Valor Agregado", :rate => 13, :abbreviation => "IVA"}, {:name => "Impuesto a las transacciones", :rate => 1.5, :abbreviation => "IT"}]
# Countries
#country = Country.create(:name => 'Bolivia', :abbreviation => 'bo', :taxes => taxes)
# Currencies
#currency = Currency.create(:name => "boliviano", :symbol => "Bs.")
#Currency.create(:name => "dolar", :symbol => "$")
#Currency.create(:name => "euro", :symbol => "€")

# When it is crated OrganisationSession.set is called to set for a model session
OrganisationSession.set = {:id => 1, :name => 'ecuanime'}
org = Organisation.create!(:name => 'ecuanime', :country_id => 1, :currency_id => 1, :phone => 2745620, :mobile => '70681101', :address => 'Mallasa calle 4 Nº 71 (La Paz - Bolivia)')

org.currency_ids = [1]
